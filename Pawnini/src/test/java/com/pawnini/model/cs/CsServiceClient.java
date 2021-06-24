package com.pawnini.model.cs;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

//1. GenericXmlAppl.... CsService class methods
//2. page 489 testing CsDAO class methods

public class CsServiceClient {
	public static void main(String [] args) {

		//1. Spring container 구동
		AbstractApplicationContext container = new GenericXmlApplicationContext("spring/root-context.xml");
		
		//2, Spring container로부터 CsServiceImpl 객체를 lookup
		CsService csService = (CsService) container.getBean("csService"); //CsServiceImpl
		
		//3. 글 등록 기능 테스트
//		CsDAOImpl csDAO = new CsDAOImpl();
		
		CsDTO dto = new CsDTO();
		dto.setCs_writer("blah");
		dto.setCs_title("title here");
		dto.setCs_show("N");
		dto.setCs_content("oops");
		dto.setCs_img("well");
		dto.setCs_file("hm");
		dto.setMember_id("123");
		System.out.println(dto.toString());
		
	//	csDAO.insertCs(dto);
		csService.insertCs(dto);
		
		
//4. 글 목록 검색 기능 테스트
	/*	List<CsDTO> csList = csService.getCsList(dto);
		
		for (CsDTO cs : csList) {
			System.out.println("===> "+cs.toString());
		}*/
		
		//5. Spring container 종료
		container.close();
		
	}
	
}
