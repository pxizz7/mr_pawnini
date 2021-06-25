package com.pawnini.model.cs.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.cs.CsDTO;
import com.pawnini.model.cs.CsSearchCriteria;

//DAO
@Repository
public class CsDAO {
	
	@Autowired
	private SqlSessionTemplate  mybatis;	
	
	//글 등록
	public void insertCs(CsDTO dto) throws Exception {
		System.out.println("---> Mybatis로 insertCs() 기능 처리");
		mybatis.insert("CsDAO.insertCs", dto);  
		//"CsDAO" => refer to namespace of a mapper @ cs-mapping.xml
		System.out.println("---> Mybatis로 insertCs() 실행 완료");
	}
	//글 수정
	public void updateCs(CsDTO dto) throws Exception {
		System.out.println("---> Mybatis로 updateCs() 기능 처리");
		mybatis.update("CsDAO.updateCs", dto);  
		System.out.println("---> Mybatis로 updateCs() 실행 완료");
	}
	//글 삭제
	public void deleteCs(CsDTO dto) throws Exception {
		System.out.println("---> Mybatis로 deleteCs() 기능 처리");
		mybatis.delete("CsDAO.deleteCs", dto);  
		System.out.println("---> Mybatis로 deleteCs() 실행 완료");
	}	
	
	//상세 조회
	public CsDTO getCs(CsDTO dto) throws Exception {
		System.out.println("--> Mybatis로 getCs() 기능 처리");
		return  (CsDTO)  mybatis.selectOne("CsDAO.getCs", dto);
	}
	
//리스트 불러오기  목록
	public List<CsDTO> getCsList(CsSearchCriteria scri) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		System.out.println("---> Mybatis로 getCsList() with Criteria class 기능 처리");
		return mybatis.selectList("CsDAO.getCsList",scri);
	}
	
	//레코드 갯수 계산 (also search된 단어에 따라 
	public int getCountCs(CsSearchCriteria scri) throws Exception {
		System.out.println("---> Mybatis로 getCountCs() with Criteria class 기능 처리");
		return mybatis.selectOne("CsDAO.getCountCs", scri);
	}
	
	//조회수 올리기
	public void csHit(CsDTO dto) throws Exception {
		System.out.println("==> Mybatis로 조회수 올리기 기능 처리 csHit()");
		mybatis.update("CsDAO.csHit", dto);
	}
	//그룹 번호 조회
	public int getCsGroup(CsDTO dto) throws Exception {
		return mybatis.selectOne("CsDAO.getCsGroup", dto);
	}
	
	//답글 정보 조회
	public CsDTO getCsReplyInfo(CsDTO dto) throws Exception {
		return mybatis.selectOne("CsDAO.getCsReplyInfo", dto);
	}
	//답글 순서 수정
	public int updateCsDepth(CsDTO dto) throws Exception {
		return mybatis.update("CsDAO.updateCsDepth", dto);
	}
	//답글 등록
	public int insertCsReply(CsDTO dto) throws Exception {
		return mybatis.insert("CsDAO.insertCsReply", dto);
	}
}
