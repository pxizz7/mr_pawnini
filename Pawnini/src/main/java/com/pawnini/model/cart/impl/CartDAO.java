package com.pawnini.model.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.cart.CartDTO;
import com.pawnini.model.cart.CartListDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void addToCart(CartDTO dto) throws Exception{
		System.out.println("Mybatis/addToCart() 기능처리 시작");
		mybatis.insert("CartDAO.addToCart", dto);
	}
	
	public List<CartListDTO> getCartList(String member_id) throws Exception{
		System.out.println("Mybatis/getCartList() 기능처리 시작");
		return mybatis.selectList("CartDAO.getCartList", member_id);
	}
	
	public void deleteCart(CartDTO dto) throws Exception{
		System.out.println("Mybatis/deleteCart() 기능처리 시작");
		mybatis.insert("CartDAO.deleteCart", dto);
	}
}
