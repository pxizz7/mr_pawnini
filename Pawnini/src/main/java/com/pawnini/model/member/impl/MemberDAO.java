package com.pawnini.model.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.member.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//아이디 중복 검사
	public int checkID(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.checkID",dto);
	}
	//회원 존재 유무 검사
	public int checkMember(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.checkMember",dto);
	}
	//회원 가입
	public void insertMember(MemberDTO dto) {
		mybatis.insert("MemberDAO.insertMember",dto);
	}
	//회원 탈퇴
	public void deleteMember(MemberDTO dto) {
		mybatis.delete("MemberDAO.deleteMember",dto);
	}
	//회원 정보 수정
	public void updateMember(MemberDTO dto) {
		mybatis.update("MemberDAO.updateMember",dto);
	}
	//회원 리스트
	public List<MemberDTO> getMemberList(MemberDTO dto) {
		System.out.println("목록 불러오기");
		return mybatis.selectList("MemberDAO.getMemberList",dto);
	}
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception{
		System.out.println("Mybatis/login() 기능처리");
		return (MemberDTO) mybatis.selectOne("MemberDAO.login", dto);
	}

}
