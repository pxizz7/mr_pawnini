package com.pawnini.model.cs;

import java.util.List;

public interface CsService {
	//CRUD 기능의 메소드 구현 (여기선 CsDAO interface랑 more or less 같음)
	//삽입
	public void insertCs(CsDTO dto) throws Exception;
	//수정
	public void updateCs(CsDTO dto) throws Exception;
	//삭제
	public void deleteCs(CsDTO dto) throws Exception;
	//상세 조회 
	public CsDTO getCs(CsDTO dto) throws Exception;
	//리스트!
	public List<CsDTO> getCsList(CsSearchCriteria scri) throws Exception;	
	//총 등록 갯수
	public int getCountCs(CsSearchCriteria scri)  throws Exception;
	//조회수 올리기
	public void csHit(CsDTO dto) throws Exception;
	//그룹 번호 조회
	public int getCsGroup(CsDTO dto) throws Exception;
	//답글 정보 조회
	public CsDTO getCsReplyInfo(CsDTO dto) throws Exception;
	//답글 순서 수정
	public int updateCsDepth(CsDTO dto) throws Exception;
	//답글 등록
	public int insertCsReply(CsDTO dto) throws Exception;
}