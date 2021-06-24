package com.pawnini.view.paws;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pawnini.model.paws.PawsDTO;
import com.pawnini.model.paws.PawsService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("paws")
public class PawsController {

	@Autowired
	private PawsService pawsService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//정보 등록 뷰 페이지 이동
	@RequestMapping("/goInsertPaws.do")
	public String goInsertPaws() {
		return "admin/paws/insertPaws";
	}
	
	//정보 등록
	@RequestMapping("/insertPaws.do")
	public String insertPaws(PawsDTO dto, MultipartFile file) throws Exception{
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setPaws_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setPaws_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		pawsService.insertPaws(dto);
		return "redirect:AdminGetPawsList.do";
	}
	
	//리스트 불러오기
	@RequestMapping("/getPawsList.do")
	public String getPawsList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getPawsList(dto));
		return "adoption/adoption";
	}
	//리스트 불러오기 (강아지)
	@RequestMapping("/getDogList.do")
	public String getDogList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getDogList(dto));
		return "adoption/adoption";
	}
	//리스트 불러오기 (고양이)
	@RequestMapping("/getCatList.do")
	public String getCatList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getCatList(dto));
		return "adoption/adoption";
	}
	
	//정보 삭제
	@RequestMapping("/deletePaws.do")
	public String deletePaws(PawsDTO dto) {
		pawsService.deletePaws(dto);
		return "redirect:AdminGetPawsList.do";
	}
	//관리자 페이지 리스트 불러오기
	@RequestMapping("/AdminGetPawsList.do")
	public String goGetPaws(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getPawsList(dto));
		return "admin/paws/getPawsList";
	}
	
	//상세 조회
	@RequestMapping("/getPaws.do")
	public String getPaws(PawsDTO dto, Model model) {
		model.addAttribute("paws", pawsService.getPaws(dto));
		return "admin/paws/getPaws";
	}
	
	//정보 수정
	@RequestMapping("/updatePaws.do")
	public String updatePaws(PawsDTO dto) {
		pawsService.updatePaws(dto);
		return "redirect:AdminGetPawsList.do";
	}
	
	// 관리 리스트
	@RequestMapping("/PawsList.do")
	public String goPawsList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getPawsList(dto));
		return "admin/paws/getPawsList";
	}
	
}












