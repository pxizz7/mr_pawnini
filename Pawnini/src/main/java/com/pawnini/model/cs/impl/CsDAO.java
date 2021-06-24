package com.pawnini.model.cs.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.cs.CsDTO;

//DAO
@Repository
public class CsDAO {
	
	@Autowired
	private SqlSessionTemplate  mybatis;	
	
	//글 등록
	public void insertCs(CsDTO dto) {
		System.out.println("---> Mybatis로 insertCs() 기능 처리");
		mybatis.insert("CsDAO.insertCs", dto);  
		//"CsDAO" => refer to namespace of a mapper @ cs-mapping.xml
		System.out.println("---> Mybatis로 insertCs() 실행 완료");
	}
	//글 수정
	public void updateCs(CsDTO dto) {
		System.out.println("---> Mybatis로 updateCs() 기능 처리");
		mybatis.update("CsDAO.updateCs", dto);  
		System.out.println("---> Mybatis로 updateCs() 실행 완료");
	}
	//글 삭제
	public void deleteCs(CsDTO dto) {
		System.out.println("---> Mybatis로 deleteCs() 기능 처리");
		mybatis.delete("CsDAO.deleteCs", dto);  
		System.out.println("---> Mybatis로 deleteCs() 실행 완료");
	}	
	
	//상세 조회
	public CsDTO getCs(CsDTO dto) {
		System.out.println("--> Mybatis로 getCs() 기능 처리");
		return  (CsDTO)  mybatis.selectOne("CsDAO.getCs", dto);
	}
	
//리스트 불러오기  목록
	public List<CsDTO> getCsList(String searchCondition, String searchKeyword, int start, int end) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", "%"+searchKeyword+"%");
		map.put("start", start);  //paging
		map.put("end", end);   //paging
		System.out.println("---> Mybatis로 getCsList() 기능 처리");
		return mybatis.selectList("CsDAO.getCsList",map);

	}
	
	//레코드 갯수 계산 (also search된 단어에 따라 
	public int getCountCs(String searchCondition, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", "%"+searchKeyword+"%");
		System.out.println("---> Mybatis로 getCountCs() 기능 처리");
		return mybatis.selectOne("CsDAO.getCountCs", map);
	}
	
}
