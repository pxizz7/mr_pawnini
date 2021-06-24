package com.pawnini.view.product_inq;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.product_inq.Inq_repDTO;
import com.pawnini.model.product_inq.Inq_repService;
import com.pawnini.model.product_inq.Product_inqDTO;
import com.pawnini.model.product_inq.Product_inqService;
import com.pawnini.model.review.PageMaker;
import com.pawnini.model.review.SearchCriteria;
import com.pawnini.utils.UploadFileUtils;


@Controller
@SessionAttributes("product_inq")
public class Product_inqController {

	@Autowired
	private Product_inqService product_inqService;
	
	@Autowired
	private Inq_repService inq_repService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/go_insertProduct_inq.do")
	public String go_insertProduct_inq(Product_inqDTO dto) throws Exception{
		System.out.println("게시물 작성페이지 진입");
		return "product_inq/insertProduct_inq";
	}
	//글 등록 
	@RequestMapping("/insertProduct_inq.do")
	public String insertProduct_inq(Product_inqDTO dto, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setInq_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setInq_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		product_inqService.insertProduct_inq(dto);
		return "redirect:getProduct_inqList.do";
	}
	
	@RequestMapping("/go_updateProduct_inq.do")
	public String go_updateProduct_inq(Product_inqDTO dto, Model model) throws Exception{
		System.out.println("게시물 수정페이지 진입");
		model.addAttribute("update_inq", product_inqService.getProduct_inq(dto));
		
		return "product_inq/updateProduct_inq";
	}
	
	//글 수정
	@RequestMapping("/updateProduct_inq.do")
	public String updateProduct_inq(Product_inqDTO dto) throws Exception {
		System.out.println(dto);
		if(dto != null) {
			product_inqService.updateProduct_inq(dto);	
		}
		return "redirect:getProduct_inqList.do";
	}
	
	//글 삭제
	@RequestMapping("/deleteProduct_inq.do")
	public String deleteProduct_inq(Product_inqDTO dto) throws Exception {
		
		product_inqService.deleteProduct_inq(dto);
		return "redirect:getProduct_inqList.do";
	}
	
	//상세 조회
	@RequestMapping("/getProduct_inq.do")
	public String getProduct_inq(Product_inqDTO dto, Model model) throws Exception {
		
		model.addAttribute("product_inq", product_inqService.getProduct_inq(dto));
		
		// 답글 조회
		List<Inq_repDTO> inq_repList = inq_repService.getInq_repList(dto.getInq_id());
		model.addAttribute("inq_repList", inq_repList);
		
		return "product_inq/getProduct_inq";
	}
	
	// 검색 조건 목록 설정
/*	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Comparator<String> comparator = (s1, s2)->s2.compareTo(s1);
		Map<String, String> conditionMap = new TreeMap<>(comparator);
		conditionMap.put("제목", "INQ_TITLE");
		conditionMap.put("내용", "INQ_CONTENT");
		conditionMap.put("작성자", "INQ_NAME");
		return conditionMap;
	} 
	*/
	//글목록 조회 (pagination 추가)
	@RequestMapping("/getProduct_inqList.do")
	public String getProduct_inqList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		System.out.println("getProduct_inqList.do() 작동");
		model.addAttribute("product_inqList", product_inqService.getProduct_inqList(scri));
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(product_inqService.countProduct_inq(scri));
			
		model.addAttribute("pageMaker", pageMaker);
			
		return "product_inq/getProduct_inqList";
	
	}		
	//댓글 삽입 POST
		@RequestMapping("/insertInq_rep.do")
		public String insertInq_rep(Product_inqDTO pdto, Inq_repDTO dto, RedirectAttributes rttr) throws Exception {
			
			product_inqService.updateInq_ans(pdto);
			System.out.println("insertInq_rep.do() 작동");
			
			inq_repService.insertInq_rep(dto);
			
			rttr.addAttribute("inq_id", dto.getInq_id());
			
			return "redirect:getProduct_inq.do";
		}
		
		//댓글 수정 View
		@RequestMapping("/go_updateInq_rep.do")
		public String go_updateInq_rep(Inq_repDTO dto, Model model) throws Exception {
			System.out.println("go_updateInq_rep.do() 작동");
			
			model.addAttribute("inq_rep", inq_repService.getInq_rep(dto.getInq_rep_id()));
			
			return "product_inq/updateInq_rep";
		}
		
		//댓글 수정 
		@RequestMapping("/updateInq_rep.do")
		public String updateInq_rep(Inq_repDTO dto, RedirectAttributes rttr) throws Exception {
			System.out.println("updateInq_rep.do() 작동");
			
			inq_repService.updateInq_rep(dto);
			
			rttr.addAttribute("inq_id", dto.getInq_id());
			
			return "redirect:getProduct_inq.do";
		}
		
		//댓글 삭제
		@RequestMapping("/deleteInq_rep.do")
		public String deleteInq_rep(Product_inqDTO pdto, Inq_repDTO dto, RedirectAttributes rttr) throws Exception {
			
			product_inqService.cancleInq_ans(pdto);
			
			System.out.println("deleteInq_rep.do() 작동");
			
			inq_repService.deleteInq_rep(dto);
			
			rttr.addAttribute("inq_id", dto.getInq_id());
			
			return "redirect:getProduct_inq.do";
		}
}












