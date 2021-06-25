package com.pawnini.model.cs.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.cs.CsDTO;
import com.pawnini.model.cs.CsSearchCriteria;
import com.pawnini.model.cs.CsService;

@Service("csService")
public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDAO csDAO;
	
	public void insertCs(CsDTO dto) throws Exception {
		csDAO.insertCs(dto);
	}
	
	public void updateCs(CsDTO dto) throws Exception {
		csDAO.updateCs(dto);
	}
	
	public void deleteCs(CsDTO dto) throws Exception{
		csDAO.deleteCs(dto);
	}
	public CsDTO getCs(CsDTO dto)  throws Exception{
		return csDAO.getCs(dto);
	}
	public List <CsDTO> getCsList(CsSearchCriteria scri) throws Exception {
		return csDAO.getCsList(scri);
	}
	
	//pagination에서 필요함 (DAO - Service - ServiceImpl)
	public int getCountCs(CsSearchCriteria scri) throws Exception {
		return csDAO.getCountCs(scri);
	}
	
	public void csHit(CsDTO dto) throws Exception {
		csDAO.csHit(dto);
	}
	//그룹 번호 조회
	public int getCsGroup(CsDTO dto) throws Exception{
		return csDAO.getCsGroup(dto);
	}
	//답글 정보 조회
	public CsDTO getCsReplyInfo(CsDTO dto) throws Exception{
		return csDAO.getCsReplyInfo(dto);	
	}
	//답글 순서 수정
	public int updateCsDepth(CsDTO dto) throws Exception{
		return csDAO.updateCsDepth(dto);
	}
	//답글 등록
	public int insertCsReply(CsDTO dto) throws Exception{
		return csDAO.insertCsReply(dto);
	}
}
