package com.pawnini.model.notice;

import java.util.List;

public interface NoticeService {
	// CRUD 기능의 메소드
	// 글 등록
	void insertNotice(NoticeDTO dto);

	// 글 수정
	void updateNotice(NoticeDTO dto);

	// 글 삭제
	void deleteNotice(NoticeDTO dto);

	// 글 상세 조회
	NoticeDTO getNotice(NoticeDTO dto);

	// 글 목록 조회
	List<NoticeDTO> getNoticeList(NoticeDTO dto);

}
