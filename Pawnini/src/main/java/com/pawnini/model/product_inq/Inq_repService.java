package com.pawnini.model.product_inq;

import java.util.List;

public interface Inq_repService {

	//  등록
	public void insertInq_rep(Inq_repDTO dto) throws Exception;
	
	//  수정
	public void updateInq_rep(Inq_repDTO dto) throws Exception;
	
	//  삭제
	public void deleteInq_rep(Inq_repDTO dto) throws Exception;
	
	//  리스트
	public List<Inq_repDTO> getInq_repList(int inq_rep_id) throws Exception;
	
	//  상세 정보 조회
	public Inq_repDTO getInq_rep(int inq_rep_id) throws Exception;
	
}
