package com.pawnini.model.cs.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.cs.Cs_replyDTO;
import com.pawnini.model.cs.Cs_replyService;

@Service("cs_replyService")
public class Cs_replyServiceImpl implements Cs_replyService {

	@Autowired
	private Cs_replyDAO cs_replyDAO;
	
	
	//saveReply
	public void insertCs(Cs_replyDTO dto) throws Exception {
		cs_replyDAO.insertCs(dto);
	}
	
	//update reply
	public void updateCs(Cs_replyDTO dto) throws Exception  {
		cs_replyDAO.updateCs(dto);
	}
	
	//delete
	public void deleteCs(Cs_replyDTO dto)throws Exception  {
		cs_replyDAO.deleteCs(dto);
	}
	
	//
	public Cs_replyDTO getCs(Cs_replyDTO dto) throws Exception  {
		return cs_replyDAO.getCs(dto);
	}
	//reply list
	public List <Cs_replyDTO> getCsList(Cs_replyDTO dto) throws Exception {
		return cs_replyDAO.getCsList(dto);
	}
}
