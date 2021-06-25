package com.pawnini.model.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.notice.NoticeDTO;
import com.pawnini.model.notice.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public void insertNotice(NoticeDTO dto) {
		noticeDAO.insertNotice(dto);
	}
	

	@Override
	public void updateNotice(NoticeDTO dto) {
		noticeDAO.updateNotice(dto);
	}

	@Override
	public void deleteNotice(NoticeDTO dto) {
		noticeDAO.deleteNotice(dto);
	}

	@Override
	public NoticeDTO getNotice(NoticeDTO dto) {
		return noticeDAO.getNotice(dto);
	}
	@Override
	 public List<NoticeDTO> getNoticeList(NoticeDTO dto)  {
		
	   return noticeDAO.getNoticeList(dto);
	    }
	}

