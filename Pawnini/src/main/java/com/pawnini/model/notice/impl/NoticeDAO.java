package com.pawnini.model.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.notice.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertNotice(NoticeDTO dto) {
		System.out.println("===> Mybatis로 insertNotice() 기능 처리");
		mybatis.insert("NoticeDAO.insertNotice", dto);
	}

	public void updateNotice(NoticeDTO dto) {
		System.out.println("===> Mybatis로 updateNotice() 기능 처리");
		mybatis.update("NoticeDAO.updateNotice", dto);
	}

	public void deleteNotice(NoticeDTO dto) {
		System.out.println("===> Mybatis로 deleteNotice() 기능 처리");
		mybatis.delete("NoticeDAO.deleteNotice", dto);
	}

	public NoticeDTO getNotice(NoticeDTO dto) {
		System.out.println("===> Mybatis로 getNotice() 기능 처리");
		return (NoticeDTO) mybatis.selectOne("NoticeDAO.getNotice", dto);
	}

	public List<NoticeDTO> getNoticeList(NoticeDTO dto)  {
		System.out.println("===> Mybatis로 getNoticeList() 기능 처리");
		return mybatis.selectList("NoticeDAO.getNoticeList", dto);
		
	}
}
