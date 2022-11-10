package com.epicer.service.cart;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.product.Product;

@Service
@Transactional
public class ProductQueryService {
	
	@Autowired
	private ProductQueryRepository productQueryRep;
	
	//新增商品
	
	//修改商品
	
	//刪除商品
	
	//查詢全部商品
	public List<Product> findAll() {
		return productQueryRep.findAll();
	}
	//查詢單一商品
	public Product findById(Integer productId) {
		return productQueryRep.getById(productId);
	}

}
