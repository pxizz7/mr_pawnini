package com.pawnini.view.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.cart.CartDTO;
import com.pawnini.model.cart.CartListDTO;
import com.pawnini.model.cart.CartService;
import com.pawnini.model.member.MemberDTO;

@Controller
@SessionAttributes("cart")
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@ResponseBody
	@RequestMapping(value="/addToCart.do", method=RequestMethod.POST)
	public int addToCart(CartDTO dto, HttpSession session) throws Exception {
		
		int result = 0;
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setMember_id(member.getMember_id());
		
		// 회원만 장바구니 담기 가능
		if(member != null) {
			dto.setMember_id(member.getMember_id());
			cartService.addToCart(dto);
			result = 1;
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/getCartList.do", method=RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) throws Exception {
		System.out.println("getCartList.do 작동");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		List<CartListDTO> cartList = cartService.getCartList(member_id);

		model.addAttribute("cartList", cartList);
		
		return "cart/getCartList";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCart.do", method=RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value="chbox[]") List<String> chArr, CartDTO dto) throws Exception{
			System.out.println("deleteCart.do 작동");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		int result = 0;
		int cart_id = 0;
		
		
		if(member != null) {
			dto.setMember_id(member_id);
			
			for(String i : chArr) {
				cart_id = Integer.parseInt(i);
				dto.setCart_id(cart_id);
				cartService.deleteCart(dto);
			}
			result = 1;
		}
		return result;
	}
	
	
}
