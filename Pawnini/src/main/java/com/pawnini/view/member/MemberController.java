package com.pawnini.view.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	//로그인 Interceptor용
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberDTO dto, HttpServletRequest request, Model model) throws Exception {
		
		MemberDTO resultDTO = service.login(dto);
		
		if(resultDTO != null && !resultDTO.getMember_id().equals("") && !resultDTO.getMember_pwd().equals("")) {
			System.out.println("login 성공");
			request.getSession().setAttribute("member", resultDTO);
			return "main";
		} else {
			System.out.println("login 실패");
			model.addAttribute("msg", "아이디와 비밀번호가 불일치합니다.");
			return "Login";
		}
	}
	
	/*//로그인
	@RequestMapping(value="/login.do")
	public String login(MemberDTO dto, HttpSession session,RedirectAttributes rttr) throws Exception {
		
		MemberDTO member = service.login(dto);
		
		if(member != null) {
			session.setAttribute("member", member);
			return "main";
		} else {
			rttr.addFlashAttribute("msg", false);
			return "Login";
		}
	}*/
	
		//로그아웃 Intercepter용
	@RequestMapping(value="/logout.do")
	public String logout(@ModelAttribute("member") MemberDTO dto, 
						HttpServletRequest request, Model model) throws Exception {
		request.getSession().removeAttribute("member");
		request.getSession().invalidate();
		
		return "main";
	}	
		
	/*//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "main";
	}*/
	
	//회원가입
	@RequestMapping(value="/insertMember.do")
	public String insertMember(MemberDTO dto) {
		service.insertMember(dto);
		
		return "main";
	}
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="/checkID.do")
	public int checkID(MemberDTO dto) {
		int checkID = service.checkID(dto);
		return checkID;
	}
	@ResponseBody
	@RequestMapping(value="/checkMember.do")
	public int checkMember(MemberDTO dto) {
		int checkMember = service.checkMember(dto);
		return checkMember;
	}
	
	// 회원정보 수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(MemberDTO dto) {
		service.updateMember(dto);
		return "Mypage";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		service.deleteMember(dto);
		return "main";
	}
	// 관리자 회원 탈퇴 처리
	@RequestMapping(value="/kickMember.do")
	public String kickMember(MemberDTO dto) {
		service.deleteMember(dto);
		return "redirect:getMemberList.do";
	}
	
	// 멤버 리스트 관리자 페이지
	@RequestMapping(value="/getMemberList.do")
	public String getMemberList(MemberDTO dto, Model model) {
		model.addAttribute("memberList", service.getMemberList(dto));
		return "admin/member/memberList";
	}
}















