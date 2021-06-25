package com.pawnini.view.cs;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.cs.CsDTO;
import com.pawnini.model.cs.CsPagination;
import com.pawnini.model.cs.CsSearchCriteria;
import com.pawnini.model.cs.CsService;

//@SessionAttributes => HttpSession에 저장시켜주는 애노테이션

@Controller
@SessionAttributes("cs")
public class CsController {
	
	@Autowired
	private CsService csService;
	
	//needed to access to view jsp file INSERTCS
	@RequestMapping("/redirectInsertCs.do")
	public String redirectInsertCs() {
			System.out.println("InsertCs.do으로 실행 전 @redirectInsertCs.do");
		return "cs/insertCs";
	}
	//글 등록
	@RequestMapping(value="/insertCs.do", method=RequestMethod.POST)
	public String insertCs(CsDTO dto) throws Exception {
		System.out.println("InsertCsController 글 등록 전: "+dto);
		
		//파일 업로드 처리
		String cs_fileName = null; //파일이름, cs_file(DB)에 저장할 이름
		MultipartFile cs_uploadFile = dto.getCs_uploadFile();
		if(!cs_uploadFile.isEmpty()) {			//첨부한파일이 존재하면
			String originalFileName = cs_uploadFile.getOriginalFilename(); //파일명 구하기
			String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기		
			UUID uuid = UUID.randomUUID();	//UUID 구하기 - 파일명 중복방지.. 일련번호
			cs_fileName = uuid+"."+ext;  //name and extension 
			cs_uploadFile.transferTo(new File("D:\\upload\\"+cs_fileName)); //D 드라이브 저장경로
			System.out.println("파일명 : "+cs_fileName);
		}
		dto.setCs_fileName(cs_fileName);
	
		//GROUP 번호 불러와서 SET
		int csGroup = csService.getCsGroup(dto); //새로운 post가 추가될때마다 CS_RE_GROUP 증가+1 
		dto.setCs_re_group(csGroup);
		System.out.println("the value of cs_re_group afterwards 글 등록 처리 결과: "+dto.getCs_re_group());
		csService.insertCs(dto);			//insert실행
		System.out.println(dto.getCs_re_group()+", "+dto.getCs_re_order()+", "+dto.getCs_re_depth());
		return "redirect:getCsList.do"; //리다이렉트로 넘기기 (final url변경되어 insertCs.do doesn't show)
	}
	
	//글 수정 페이지로 이동
	@RequestMapping(value="/updateCs.do", method=RequestMethod.GET)
	public String getUpdate(CsDTO dto, @ModelAttribute("scri") CsSearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("csList", csService.getCs(dto));   //data 가져와서
		model.addAttribute("scri", scri);
		return "cs/updateCs";
	}
	//글 수정 POST -- 상세페이지로 이동
		@RequestMapping(value="/updateCs.do", method=RequestMethod.POST)
		public String postUpdate(CsDTO dto, @ModelAttribute("scri") CsSearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			csService.updateCs(dto);
			
			rttr.addAttribute("curPage", scri.getCurPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchOption", scri.getSearchOption());
			rttr.addAttribute("searchKeyword", scri.getSearchKeyword());
			
			System.out.println("UpdateCsController 글 수정 처리 결과: "+dto);
			return  "redirect:getCsList.do";
		}
		
	//글 삭제
	@RequestMapping(value="/deleteCs.do")
	public String deleteCs(CsDTO dto, @ModelAttribute("scri") CsSearchCriteria scri,	RedirectAttributes rttr) throws Exception {
		
		csService.deleteCs(dto);
		
		rttr.addAttribute("curPage", scri.getCurPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchOption", scri.getSearchOption());
		rttr.addAttribute("searchKeyword", scri.getSearchKeyword());
		
		System.out.println("deleteCs처리");
		return "redirect:getCsList.do";
	}
	
	@RequestMapping(value="/getCs.do", method=RequestMethod.GET)
	public String getCs(CsDTO dto, @ModelAttribute("scri") CsSearchCriteria scri, Model model) throws Exception{		//model 정보 저장
		
		CsPagination csPagination = new CsPagination(); //for 이전글 다음글
		csPagination.setCri(scri);
		csPagination.setTotalCount(csService.getCountCs(scri)); //전체 레코드
		model.addAttribute("csPagination", csPagination);
		//조회수
		csService.csHit(dto);	//조회수
		model.addAttribute("cs", csService.getCs(dto));	//상세 정보 저장
		model.addAttribute("scri", scri);
		
		System.out.println("저장되있던 data (getCs())... : "+dto);
		return "cs/getCs";//view 이름 리턴
	}
	
	//글 목록 조회    pagination 추가
	@RequestMapping(value = "/getCsList.do", method=RequestMethod.GET)
	public String getCsList(Model model, @ModelAttribute("scri")  CsSearchCriteria scri) throws Exception {
		
		model.addAttribute("csList", csService.getCsList(scri)); //게시물 목록

		CsPagination csPagination = new CsPagination();
		csPagination.setCri(scri);
		csPagination.setTotalCount(csService.getCountCs(scri)); //전체 레코드 

		model.addAttribute("csPagination", csPagination);
		return "cs/getCsList"; 	//getCsList.jsp로 이동		
	}
	//답글 페이지 이동
	@RequestMapping(value="/csReply.do")
	public String csReply(CsDTO dto) throws Exception {
		System.out.println("csReply.do로 이롱..."+dto);		
		return "cs/csReply";
	}
	//답글 등록
	@RequestMapping(value="/insertCsReply.do", method=  RequestMethod.GET)
	public String insertCsReply(CsDTO dto) throws Exception {
		
		CsDTO csReplyInfo = csService.getCsReplyInfo(dto);
		System.out.println("csReplyInfo 가져오기"+csReplyInfo);
		//setting values for post order
		dto.setCs_id(csReplyInfo.getCs_id());
		dto.setCs_re_group(csReplyInfo.getCs_re_group());
		dto.setCs_re_order(csReplyInfo.getCs_re_order());
		dto.setCs_re_depth(csReplyInfo.getCs_re_depth());

		System.out.println("insertCsReply 실행전");
		csService.updateCsDepth(dto);
		csService.insertCsReply(dto);
		System.out.println("insertCsReply executed..");
		return "redirect:getCsList.do";
	}
}
