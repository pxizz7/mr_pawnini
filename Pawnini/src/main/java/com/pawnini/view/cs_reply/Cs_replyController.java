package com.pawnini.view.cs_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.cs.Cs_replyDTO;
import com.pawnini.model.cs.Cs_replyService;

@RestController
@RequestMapping(value="/")
@SessionAttributes("cs_reply")
public class Cs_replyController {
	@Autowired
	private Cs_replyService cs_replyService;
	
	//needed to access to view jsp file INSERTCS
	@RequestMapping("/redirectInsertCs_reply.do")
	public String redirectInsertCs_reply() {
		return "cs/insertCs_reply";
	}
	
	//글 등록
	@RequestMapping("/insertCs_reply.do")
	public String insertCs_reply(Cs_replyDTO dto) throws Exception {
		//글등록 처리
		cs_replyService.insertCs(dto);
		System.out.println("InsertCs_replyController 글 수정 처리 결과"); System.out.println("▶ dto.getCs_reply_id(): "+dto.getCs_reply_id());  System.out.println("▶ dto.getCs_reply_title(): "+dto.getCs_reply_title()); System.out.println("▶ dto.getCs_reply_writer(): "+dto.getCs_reply_writer()); 
		System.out.println("▶ dto.getCs_reply_show() "+dto.getCs_reply_show()); System.out.println("▶ dto.getCs_reply_regdate(): "+dto.getCs_reply_regdate());  System.out.println("▶ dto.getCs_reply_content(): "+dto.getCs_reply_content()); 
		return "redirect:getCs_replyList.do"; //리다이렉트로 넘기기 (final url변경되어 insertCs.do doesn't show)
	}
	//글 수정 페이지로 이동
	@RequestMapping(value="/updateCs_reply.do", method=RequestMethod.GET)
	public String getUpdate(Cs_replyDTO dto, Model model) throws Exception {
		model.addAttribute("cs_reply", cs_replyService.getCs(dto));   //data 가져와서
		return "cs/updateCs";
	}
	
	//글 수정 POST -- 상세페이지로 이동
	@RequestMapping(value="/updateCs_reply.do", method=RequestMethod.POST)
	public String postUpdate(Cs_replyDTO dto) throws Exception {
		cs_replyService.updateCs(dto);
		System.out.println("InsertCs_replyController 글 수정 처리 결과"); System.out.println("▶ dto.getCs_reply_id(): "+dto.getCs_reply_id());  System.out.println("▶ dto.getCs_reply_title(): "+dto.getCs_reply_title()); System.out.println("▶ dto.getCs_reply_writer(): "+dto.getCs_reply_writer()); 
		System.out.println("▶ dto.getCs_reply_show() "+dto.getCs_reply_show()); System.out.println("▶ dto.getCs_reply_regdate(): "+dto.getCs_reply_regdate());  System.out.println("▶ dto.getCs_reply_content(): "+dto.getCs_reply_content()); 
		return  "redirect:getCs_replyList.do";
		}
		
	//글 삭제
	@RequestMapping("/deleteCs_reply.do")
	public String deleteCs_reply(Cs_replyDTO dto) throws Exception {
		cs_replyService.deleteCs(dto);
		return "redirect:getCs_replyList.do";
	}
	
	@RequestMapping("/getCs_reply.do")
	public String getCs_reply(Cs_replyDTO dto, Model model) throws Exception {		//model 정보 저장
		model.addAttribute("cs_reply", cs_replyService.getCs(dto));		
		return "cs/getCs_reply";//view 이름 리턴
	}
	
	//글 목록 조회
	@RequestMapping("/getCs_replyList.do")
	public String getCs_replyList(Cs_replyDTO dto, Model model) throws Exception {    //Model 정보저장 ....  null check
		model.addAttribute("cs_replyList", cs_replyService.getCsList(dto));
		System.out.println("cs_reply리스트 조회 성공");
		return "cs/getCs_replyList";		
	}
}
