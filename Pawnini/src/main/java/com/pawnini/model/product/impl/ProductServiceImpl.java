package com.pawnini.model.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductSearchCriteria;
import com.pawnini.model.product.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public void insertProduct(ProductDTO dto) {
		productDAO.insertProduct(dto);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDAO.updateProduct(dto);
	}

	@Override
	public void deleteProduct(ProductDTO dto) {
		productDAO.deleteProduct(dto);
	}

	@Override
	public List<ProductDTO> getProductList(ProductSearchCriteria scri) throws Exception {
		return productDAO.getProductList(scri);
	}

	@Override
	public ProductDTO getProduct(ProductDTO dto) throws Exception {
		return productDAO.getProduct(dto);
	}

	@Override
	public int getCountProduct(ProductSearchCriteria scri) throws Exception {
		System.out.println("Pagination - 상품 갯수 세기");
		return productDAO.getCountProduct(scri);
	}
	
	@Override
	public void productHits(ProductDTO dto) {
		productDAO.productHits(dto); 
	}
	
}
