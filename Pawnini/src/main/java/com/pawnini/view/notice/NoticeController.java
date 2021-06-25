package com.pawnini.view.notice;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.notice.NoticeDTO;
import com.pawnini.model.notice.NoticeService;

@Controller
@SessionAttributes("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 글 등록 페이지 진입
	@RequestMapping(value = "/go_insertNotice.do")
	public String go_insertNotice() throws IOException {
		return "notice/insertNotice";

	}

	// 글 등록
	@RequestMapping(value = "/insertNotice.do")
	public String insertNotice(NoticeDTO dto) throws IOException {
		noticeService.insertNotice(dto);
		return "redirect:/getNoticeList.do";
	}
	
	// 글 수정 페이지 진입
	@RequestMapping(value="/go_updateNotice.do")
	public String goupdateNotice(NoticeDTO dto) {
		noticeService.getNotice(dto);
		return "notice/updateNotice";
	}
	// 글 수정
	@RequestMapping("/updateNotice.do")
	public String updateNotice(@ModelAttribute("notice") NoticeDTO dto) {
		noticeService.updateNotice(dto);
		 return "redirect:/getNoticeList.do";
		//return "notice/getNoticeList";

	}

	// 글 삭제
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(NoticeDTO dto) {
		noticeService.deleteNotice(dto);
		return "redirect:/getNoticeList.do";
	}

	// 글 상세 조회
	@RequestMapping(value = "/getNotice.do")
	public String getNotice(Model model, NoticeDTO dto) {
		model.addAttribute("notice", noticeService.getNotice(dto)); // Model 정보 저장
		System.out.println("===> Mybatis로 getNotice() 기능 처리");
		return "notice/getNotice"; // View 이름 리턴
	}

	// 글 목록 검색
	@RequestMapping(value = "/getNoticeList.do")
	public String getNoticeList(Model model, NoticeDTO dto) {

		System.out.println("===> Mybatis로 getNoticeList() 기능 처리");

		// Model 정보 저장
		model.addAttribute("noticeList", noticeService.getNoticeList(dto));
		System.out.println("===> 컨트롤러 getNoticeList() 기능처리끝");
		System.out.println(model);
		// return "redirect:getNoticeList.do";
		return "notice/getNoticeList"; // View 이름 리턴
	}
}
