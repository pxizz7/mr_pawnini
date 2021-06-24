package com.pawnini.model.product_inq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.product_inq.Inq_repDTO;



@Repository
public class Inq_repDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글 목록 불러오기
	public List<Inq_repDTO> getInq_repList(int inq_rep_id) throws Exception{
		return mybatis.selectList("Inq_repDAO.getInq_repList", inq_rep_id);
	}
	//댓글 삽입
	public void insertInq_rep(Inq_repDTO dto) throws Exception{
		mybatis.insert("Inq_repDAO.insertInq_rep", dto);
	}
	//댓글 수정
	public void updateInq_rep(Inq_repDTO dto) throws Exception{
		mybatis.update("Inq_repDAO.updateInq_rep", dto);
	}
	//댓글 삭제
	public void deleteInq_rep(Inq_repDTO dto) throws Exception{
		mybatis.delete("Inq_repDAO.deleteInq_rep", dto);
	}
	
	//선택한 댓글 조회
	public Inq_repDTO getInq_rep(int inq_rep_id) throws Exception{
		return mybatis.selectOne("Inq_repDAO.getInq_rep", inq_rep_id);
	}
	
}
