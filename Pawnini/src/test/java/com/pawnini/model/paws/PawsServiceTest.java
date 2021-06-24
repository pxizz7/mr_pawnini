package com.pawnini.model.paws;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PawsServiceTest {
	public static void main(String[] args) {
		
		AbstractApplicationContext container = new GenericXmlApplicationContext("spring/root-context.xml");
		
		PawsService pawsSerivce = (PawsService) container.getBean("pawsService");
		
		PawsDTO dto = new PawsDTO();
		dto.setPaws_f_code("a");
		dto.setPaws_s_code("b");
		dto.setPaws_name("a");
		dto.setPaws_age("a");
		dto.setPaws_img("a");
		dto.setPaws_desc("a");
		dto.setPaws_sex("a");
		dto.setPaws_is_neutered('Y');
		dto.setPaws_health("a");
		pawsSerivce.insertPaws(dto);
		
		/*List<PawsDTO> pawsList = pawsSerivce.getPawsList(dto);
		for(PawsDTO paws: pawsList) {
			System.out.println("--> " + paws.toString());
		}*/
		
		
		container.close();
	}
}
