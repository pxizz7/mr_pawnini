package com.pawnini.view.review;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.review.PageMaker;
import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewLikeService;
import com.pawnini.model.review.ReviewReplyDTO;
import com.pawnini.model.review.ReviewReplyService;
import com.pawnini.model.review.ReviewService;
import com.pawnini.model.review.SearchCriteria;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewReplyService reviewReplyService;
	
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//후기 등록 View 이동
	@RequestMapping("/insertReviewView.do")
	public String insertReviewView() throws Exception {
		System.out.println("insertReviewView.do() 작동");
		
		return "review/insertReviewView";
	}
	
	//후기 등록
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewDTO dto, MultipartFile file) throws Exception {
		System.out.println("insertReview.do() 작동");
		
		// 이미지 파일 첨부, 썸네일 경로 설정 
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setRev_f_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setRev_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		System.out.println(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		// 후기 DB 삽입
		reviewService.insertReview(dto);
		
		return "redirect:/getReviewList.do";
	}
	
	//후기 수정
	@RequestMapping(value="/updateReviewView.do", method = RequestMethod.GET)
	public String updateReviewView(ReviewDTO dto, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		System.out.println("updateReviewView.do() 작동");
		model.addAttribute("update", reviewService.getReview(dto));
		
		//Pager 추가
		model.addAttribute("scri", scri);
		
		return "review/updateReviewView";
	}
	
	@RequestMapping(value="/updateReview.do", method = RequestMethod.POST)
	public String updateReview(ReviewDTO dto, @ModelAttribute("scri") SearchCriteria scri, 
								MultipartFile file, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		System.out.println("updateReview.do() 작동");
		
		
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("rev_f_img")).delete();
		  new File(uploadPath + req.getParameter("rev_thumb_img")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  dto.setRev_f_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  dto.setRev_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  dto.setRev_f_img(req.getParameter("rev_f_img"));
		  dto.setRev_thumb_img(req.getParameter("rev_thumb_img"));
		  
		 }
		
		//정보 업데이트
		reviewService.updateReview(dto);
		
		//Redirect w pager
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/getReviewList.do";
	}
	
	//후기 삭제
	@RequestMapping(value="/deleteReview.do", method = RequestMethod.POST)
	public String deleteReview(ReviewDTO dto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		System.out.println("deleteReview.do() 작동");
		
		reviewService.deleteReview(dto);
		
		//Redirect w pager
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/getReviewList.do";
	}

	//후기 목록 불러오기 (pagination 추가)
	@RequestMapping("/getReviewList.do")
	public String getReviewList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		System.out.println("getReviewList.do() 작동");
		
		//후기 목록 저장
		model.addAttribute("reviewList", reviewService.getReviewList(scri));
		
		//Pager 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reviewService.countReviewList(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/getReviewList";
	}
	
	//후기 상세 보기
	@RequestMapping("/getReview.do")
	public String getReview(@RequestParam("rev_id") int rev_id,
							@ModelAttribute("scri") SearchCriteria scri,
							HttpSession session, ReviewDTO dto, Model model) throws Exception {
		
		System.out.println("getReview.do() 작동");
		
	
		//후기 상세 조회 정보 저장
		model.addAttribute("review", reviewService.getReview(dto));
		
		//Pager 추가
		model.addAttribute("scri", scri);
		
		//getReviewList의 후기 게시글 제목 옆 댓글 개수 업데이트
		reviewService.updateReplyCount(rev_id);
		
		//좋아요 불러오기
		//1.로그인 여부 확인
		String member_id = ((MemberDTO) session.getAttribute("member")).getMember_id();
		//2.좋아요 객체 생성 + 주입 
		
		ReviewLikeDTO likeDTO = new ReviewLikeDTO();
		
		likeDTO.setRev_id(rev_id);
		likeDTO.setMember_id(member_id);
		
		int reviewLike = reviewLikeService.getReviewLike(likeDTO);
		System.out.println("getReviewLike : " + reviewLike);
		
		//3.저장
		model.addAttribute("like", reviewLike);
		
		//댓글 조회
		List<ReviewReplyDTO> reviewReplyList = reviewReplyService.readReply(dto.getRev_id());
		model.addAttribute("reviewReplyList", reviewReplyList);
		
		return "review/getReview";
	}
	
	//댓글 삽입 POST
	@RequestMapping("/insertReviewReply.do")
	public String insertReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("insertReviewReply.do() 작동");
		
		reviewReplyService.insertReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:/getReview.do";
	}
	
	//댓글 수정 View
	@RequestMapping("/updateReviewReplyView.do")
	public String updateReviewReplyView(ReviewReplyDTO dto, Model model) throws Exception {
		System.out.println("updateReviewReplyView.do() 작동");
		
		model.addAttribute("replyUpdate", reviewReplyService.getReviewReply(dto.getRev_com_id()));
		
		return "review/updateReviewReplyView";
	}
	
	//댓글 수정 
	@RequestMapping("/updateReviewReply.do")
	public String updateReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("updateReviewReply.do() 작동");
		
		reviewReplyService.updateReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:/getReview.do";
	}
	
	//댓글 삭제
	@RequestMapping("/deleteReviewReply.do")
	public String deleteReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("deleteReviewReply.do() 작동");
		
		reviewReplyService.deleteReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:/getReview.do";
	}
	
	
	//좋아요
	@ResponseBody
	@RequestMapping("/reviewLike.do")
	public int reviewLike(HttpServletRequest req) throws Exception {
		int like = Integer.parseInt(req.getParameter("like"));
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));
		String member_id = ((MemberDTO) req.getSession().getAttribute("member")).getMember_id();
		
		ReviewLikeDTO revlikeDTO = new ReviewLikeDTO();
		
		revlikeDTO.setRev_id(rev_id);
		revlikeDTO.setMember_id(member_id);
		
	
		System.out.println(like);
		
		if(like >= 1) {
			reviewLikeService.deleteReviewLike(revlikeDTO);
			like = 0;
		} else {
			reviewLikeService.insertReviewLike(revlikeDTO);
			like = 1;
		}
		return like;
	}
	
	@ResponseBody
	@RequestMapping("/reviewLikeCount.do")
	public int reviewLikeCount(HttpServletRequest req) throws Exception {
		
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));

		ReviewLikeDTO revLikeDTO = new ReviewLikeDTO();
		
		revLikeDTO.setRev_id(rev_id);
		
		int totalLike = reviewLikeService.getReviewLikeTotal(revLikeDTO);
	
		return totalLike;
	}
	
}
