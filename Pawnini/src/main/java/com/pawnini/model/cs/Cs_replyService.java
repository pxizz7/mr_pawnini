package com.pawnini.model.cs;

import java.util.List;

public interface Cs_replyService {
	//CRUD 기능의 메소드 구현 
	//삽입
	void insertCs(Cs_replyDTO dto) throws Exception;
	//수정
	void updateCs(Cs_replyDTO dto) throws Exception;
	//삭제
	void deleteCs(Cs_replyDTO dto) throws Exception;
	//상세 조회 
	Cs_replyDTO getCs(Cs_replyDTO dto) throws Exception;
	//리스트!
	List<Cs_replyDTO> getCsList(Cs_replyDTO dto) throws Exception;	
}
