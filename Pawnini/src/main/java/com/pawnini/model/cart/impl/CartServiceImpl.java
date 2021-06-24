package com.pawnini.model.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.cart.CartDTO;
import com.pawnini.model.cart.CartListDTO;
import com.pawnini.model.cart.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public void addToCart(CartDTO dto) throws Exception {
		System.out.println("카트 추가");
		cartDAO.addToCart(dto);
	}

	@Override
	public List<CartListDTO> getCartList(String member_id) throws Exception {
		System.out.println("카트 목록");
		return cartDAO.getCartList(member_id);
	}

	@Override
	public void deleteCart(CartDTO dto) throws Exception {
		System.out.println("카트 삭제");
		cartDAO.deleteCart(dto);
	}
}
