package com.pawnini.model.paws.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.paws.PawsDTO;

@Repository
public class PawsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 등록
	public void insertPaws(PawsDTO dto) {
		System.out.println("등록처리");
		System.out.println(dto.toString());
		mybatis.insert("PawsDAO.insertPaws",dto);
		System.out.println("mybatis 실행완료");
	}
	// 수정
	public void updatePaws(PawsDTO dto) {
		System.out.println("수정처리");
		mybatis.update("PawsDAO.updatePaws",dto);
	}
	//삭제 
	public void deletePaws(PawsDTO dto) {
		System.out.println("삭제처리");
		mybatis.delete("PawsDAO.deletePaws",dto);
	}
	//상세보기
	public PawsDTO getPaws(PawsDTO dto) {
		System.out.println("상세보기");
		return (PawsDTO) mybatis.selectOne("PawsDAO.getPaws",dto);
	}
	//리스트 불러오기
	public List<PawsDTO> getPawsList(PawsDTO dto) {
		System.out.println("목록 불러오기");
		return mybatis.selectList("PawsDAO.getPawsList",dto);
	}
	//강아지 리스트 불러오기
	public List<PawsDTO> getDogList(PawsDTO dto) {
		System.out.println("목록 불러오기");
		return mybatis.selectList("PawsDAO.getDogList",dto);
	}
	//고양이 리스트 불러오기
	public List<PawsDTO> getCatList(PawsDTO dto) {
		System.out.println("목록 불러오기");
		return mybatis.selectList("PawsDAO.getCatList",dto);
	}
	//리스트 수 불러오기
	public int getCountPaws(PawsDTO dto) {
		System.out.println("리스트 등록수 불러오기");
		return mybatis.selectOne("PawsDTO.getCountPaws",dto);
	}
	
}
