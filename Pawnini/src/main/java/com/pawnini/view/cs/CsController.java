package com.pawnini.view.cs;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pawnini.model.cs.CsDTO;
import com.pawnini.model.cs.CsPagination;
import com.pawnini.model.cs.CsService;

//@SessionAttributes => HttpSession에 저장시켜주는 애노테이션

@Controller
@SessionAttributes("csData")
public class CsController {

	@Autowired
	private CsService csService;

	// needed to access to view jsp file INSERTCS
	@RequestMapping("/redirectInsertCs.do")
	public String redirectInsertCs() {
		return "cs/insertCs";
	}

	// 글 등록
	@RequestMapping("/insertCs.do")
	public String insertCs(CsDTO dto) {

		// MultipartFile uploadedFile = dto.getUploadedFile();
		// if(!uploadedFile.isEmpty()) {
		// System.out.println("파일 업로드 처리");
		// String fileName = uploadedFile.getOriginalFilename();
		// 이거
		// uploadedFile.transferTo(new File ("C:/uploadtest/"+fileName));
		// }
		// 글등록 처리
		csService.insertCs(dto);
		System.out.println("InsertCsController 글 수정 처리 결과");
		System.out.println("▶ dto.getCs_id(): " + dto.getCs_id());
		System.out.println("▶ dto.getCs_title(): " + dto.getCs_title());
		System.out.println("▶ dto.getCs_writer(): " + dto.getCs_writer());
		System.out.println("▶ dto.getCs_show() " + dto.getCs_show());
		System.out.println("▶ dto.getCs_regdate(): " + dto.getCs_regdate());
		System.out.println("▶ dto.getCs_content(): " + dto.getCs_content());
		return "redirect:getCsList.do"; // 리다이렉트로 넘기기 (final url변경되어 insertCs.do doesn't show)
	}

	// 글 수정 페이지로 이동
	@RequestMapping(value = "/updateCs.do", method = RequestMethod.GET)
	public String getUpdate(CsDTO dto, Model model) throws Exception {
		model.addAttribute("csData", csService.getCs(dto)); // data 가져와서
		return "cs/updateCs";
	}

	// 글 수정 POST -- 상세페이지로 이동
	@RequestMapping(value = "/updateCs.do", method = RequestMethod.POST)
	public String postUpdate(CsDTO dto) throws Exception {
		csService.updateCs(dto);
		System.out.println("UpdateCsController 글 수정 처리 결과");
		System.out.println("▶ dto.getCs_id(): " + dto.getCs_id());
		System.out.println("▶ dto.getCs_title(): " + dto.getCs_title());
		System.out.println("▶ dto.getCs_writer(): " + dto.getCs_writer());
		System.out.println("▶ dto.getCs_show() " + dto.getCs_show());
		System.out.println("▶ dto.getCs_regdate() <= null이 정상임 받아지는 data가 없으니까 ><: " + dto.getCs_regdate());
		System.out.println("▶ dto.getCs_content(): " + dto.getCs_content());
		return "redirect:getCsList.do";
	}

	// 글 삭제
	@RequestMapping("/deleteCs.do")
	public String deleteCs(CsDTO dto) {
		csService.deleteCs(dto);
		return "redirect:getCsList.do";
	}

	@RequestMapping(value = "/getCs.do", method = RequestMethod.GET)
	public String getCs(CsDTO dto, Model model) { // model 정보 저장
		model.addAttribute("csData", csService.getCs(dto));
		return "cs/getCs";// view 이름 리턴
	}

	// 글 목록 조회 getCsList() & getCountCs()
	@RequestMapping("/getCsList.do")
	public ModelAndView getCsList(@RequestParam(defaultValue = "CS_ALL") String searchCondition,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {
		// 레코드 갯수 계산
		System.out.println("ModelAndView getCsList()@Controller");

		int count = csService.getCountCs(searchCondition, searchKeyword); // 검색/키워드 고려

		System.out.println("After getCountcs() completed");
		// 페이지 관련 설정
		CsPagination csPagination = new CsPagination(count, curPage);
		int start = csPagination.getPageBegin();
		int end = csPagination.getPageEnd();

		List<CsDTO> csList = csService.getCsList(searchCondition, searchKeyword, start, end); // 게시물 목록

		HashMap<String, Object> map = new HashMap<>(); // 여러개의 값을 저장
		map.put("csList", csList); // map에 자료 저장
		map.put("count", count);
		map.put("csPagination", csPagination); // 페이지 네비게이션을 위한 변수
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/getCsList"); // 부를 getCsList.jsp로 설정
		mav.addObject("map", map); // ModelAndView에 map을 저장

		return mav; // getCsList.jsp로 이동
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") // jsp에서 불러오기conditionMap = hashmap so key, value 사용
	public Map<String, String> searchConditionMap() {
		Comparator<String> comparator = (s1, s2) -> s2.compareTo(s1);
		Map<String, String> conditionMap = new TreeMap<>(comparator);
		conditionMap.put("제목", "CS_TITLE");
		conditionMap.put("내용", "CS_CONTENT");
		conditionMap.put("작성자", "CS_WRITER");
		conditionMap.put("제목+내용+작성자", "CS_ALL");
		return conditionMap;
	}
}
