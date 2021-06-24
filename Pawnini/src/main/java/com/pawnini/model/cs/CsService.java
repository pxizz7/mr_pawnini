package com.pawnini.model.cs;

import java.util.List;

public interface CsService {
	//CRUD 기능의 메소드 구현 (여기선 CsDAO interface랑 more or less 같음)
	//삽입
	public void insertCs(CsDTO dto);
	//수정
	public void updateCs(CsDTO dto);
	//삭제
	public void deleteCs(CsDTO dto);
	//상세 조회 
	public CsDTO getCs(CsDTO dto);
	//리스트!
	public List<CsDTO> getCsList(String searchCondition, String searchKeyword, int start, int end) throws Exception;	
	//총 등록 갯수
	public int getCountCs(String searchCondition, String searchKeyword)  throws Exception;
}