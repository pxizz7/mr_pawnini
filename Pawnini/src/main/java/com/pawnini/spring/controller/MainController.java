package com.pawnini.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "main";
	}
	
	/********************************** 헤더 경로지정 컨트롤러 ************************************/
	@RequestMapping("/gologin.do")
	public String login() {
		return "Login";
	}
	@RequestMapping("/signUp.do")
	public String signUp() {
		return "signUp";
	}
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "Mypage";
	}
	@RequestMapping("/mypage1.do")
	public String mypage1() {
		return "Mypage2";
	}
	@RequestMapping("/main.do")
	public String logoClick() {
		return "main";
	}
	@RequestMapping("/dogSnack.do")
	public String dogSnack() {
		return "product/Snack";
	}
	@RequestMapping("/dogSupplies.do")
	public String dogSupplies() {
		return "product/Supplies";
	}
	@RequestMapping("/dogMeal.do")
	public String dogMeal() {
		return "product/meal";
	}
	@RequestMapping("/catSnack.do")
	public String catSnack() {
		return "productCat/Snack";
	}
	@RequestMapping("/catSupplies.do")
	public String catSupplies() {
		return "productCat/Supplies";
	}
	@RequestMapping("/catMeal.do")
	public String catMeal() {
		return "productCat/meal";
	}
	@RequestMapping("/event.do")
	public String event() {
		return "EVENT/event";
	}
	@RequestMapping("/service.do")
	public String service() {
		return "Service/Service";
	}
	@RequestMapping("/adoption.do")
	public String adoption() {
		return "adoption/adoptionHome";
	}
	@RequestMapping("/notice.do")
	public String notice() {
		return "NOTIC/Notice";
	}
	@RequestMapping("/basket.do")
	public String basket() {
		return "basket";
	}
	@RequestMapping("/detail.do")
	public String detail() {
		return "product/detail";
	}
	
}








