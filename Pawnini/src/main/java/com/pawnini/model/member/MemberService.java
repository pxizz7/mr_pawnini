package com.pawnini.model.member;

import java.util.List;

public interface MemberService {

	// 아이디 중복검사
	int checkID(MemberDTO dto);
	
	// 로그인시 회원 체크
	int checkMember(MemberDTO dto);
	
	// 회원가입
	void insertMember(MemberDTO dto);
	
	// 회원정보수정
	void updateMember(MemberDTO dto);
	
	// 회원 탈퇴
	void deleteMember(MemberDTO dto);
	
	// 로그인
	MemberDTO login(MemberDTO dto) throws Exception;
	
	// 회원 리스트
	List<MemberDTO> getMemberList(MemberDTO dto);
		
}
