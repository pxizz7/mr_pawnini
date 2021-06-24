package com.pawnini.model.cart;

import java.util.List;

public interface CartService {
	
	public void addToCart(CartDTO dto) throws Exception;
	
	public List<CartListDTO> getCartList(String member_id) throws Exception;
	
	public void deleteCart(CartDTO dto) throws Exception;

}
