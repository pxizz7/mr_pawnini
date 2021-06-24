package com.pawnini.model.cs.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.cs.Cs_replyDTO;

@Repository
public class Cs_replyDAO {
	//DAO
		@Autowired
		private SqlSessionTemplate  mybatis;	
		
		//글 등록
		public void insertCs(Cs_replyDTO dto) throws Exception {
			System.out.println("---> Mybatis로 insertCs() 기능 처리");
			mybatis.insert("Cs_replyDAO.insertCs", dto);  
			//"Cs_replyDAO" => refer to namespace of a mapper @ cs_reply-mapping.xml
			System.out.println("---> Mybatis로 insertCs() 실행 완료");
		}
		//글 수정
		public void updateCs(Cs_replyDTO dto) throws Exception {
			System.out.println("---> Mybatis로 updateCs() 기능 처리");
			mybatis.update("Cs_replyDAO.updateCs", dto);  
			System.out.println("---> Mybatis로 updateCs() 실행 완료");
		}
		//글 삭제
		public void deleteCs(Cs_replyDTO dto) throws Exception {
			System.out.println("---> Mybatis로 deleteCs() 기능 처리");
			mybatis.delete("Cs_replyDAO.deleteCs", dto);  
			System.out.println("---> Mybatis로 deleteCs() 실행 완료");
		}	
		
		//상세 조회
		public Cs_replyDTO getCs(Cs_replyDTO dto) throws Exception {
			System.out.println("--> Mybatis로 getCs() 기능 처리");
			return  (Cs_replyDTO)  mybatis.selectOne("Cs_replyDAO.getCs", dto);
		}
		
	//리스트 불러오기 
		public List<Cs_replyDTO> getCsList(Cs_replyDTO dto) throws Exception {
			System.out.println("---> Mybatis로 getCsList() 기능 처리");
			return mybatis.selectList("Cs_replyDAO.getCsList", dto);
		}
		
}
