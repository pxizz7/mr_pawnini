package com.pawnini.model.product_inq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.product_inq.Product_inqDTO;
import com.pawnini.model.product_inq.Product_inqService;
import com.pawnini.model.review.SearchCriteria;

@Service("product_inqService")
public class Product_inqServiceImpl implements Product_inqService {

	@Autowired
	private Product_inqDAO product_inqDAO;
	
	@Override
	public void insertProduct_inq(Product_inqDTO dto) throws Exception {
		product_inqDAO.insertProduct_inq(dto);
	}

	@Override
	public void updateProduct_inq(Product_inqDTO dto) throws Exception {
		product_inqDAO.updateProduct_inq(dto);
	}

	@Override
	public void deleteProduct_inq(Product_inqDTO dto) throws Exception {
		product_inqDAO.deleteProduct_inq(dto);
	}

	@Override
	public List<Product_inqDTO> getProduct_inqList(SearchCriteria scri) throws Exception {
		return product_inqDAO.getProduct_inqList(scri);
	}

	@Override
	public Product_inqDTO getProduct_inq(Product_inqDTO dto) throws Exception {
		return product_inqDAO.getProduct_inq(dto);
	}
	
	@Override
	public int countProduct_inq(SearchCriteria scri) throws Exception {
		return product_inqDAO.countProduct_inq(scri);
	}
	
	@Override
	public void updateInq_ans(Product_inqDTO dto) throws Exception {
		product_inqDAO.updateInq_ans(dto);
	}
	@Override
	public void cancleInq_ans(Product_inqDTO dto) throws Exception {
		product_inqDAO.cancleInq_ans(dto);
	}
}
