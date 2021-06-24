package com.pawnini.model.paws;

import java.util.List;

public interface PawsService {
	
	// 동물 정보 등록
	void insertPaws(PawsDTO dto);
	
	// 동물 정보 수정
	void updatePaws(PawsDTO dto);
	
	// 동물 정보 삭제
	void deletePaws(PawsDTO dto);
	
	// 동물 정보 리스트
	List<PawsDTO> getPawsList(PawsDTO dto);
	List<PawsDTO> getDogList(PawsDTO dto);
	List<PawsDTO> getCatList(PawsDTO dto);
	
	// 동물 상세 정보 조회
	PawsDTO getPaws(PawsDTO dto);
	
	// 총 등록 갯수
	int getCountPaws(PawsDTO dto);
	
}
