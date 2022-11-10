package com.epicer.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderProductDetails;

@Service
@Transactional
public class OrderProductDetailsService {
	
	@Autowired
	private OrderProductDetailsRepository OPDRep;
	
	//新增訂單明細
	//跟訂單總表一起寫入了
	
	
	
	//利用orderproductid(訂單編號)查出訂單明細 (ECPAY用到)
	public List<OrderProductDetails> findByOrderProductId(Integer orderProductId) {
		return OPDRep.findByOrderProductId(orderProductId);
	}
	
	//如果發生退貨(Returns) → 更新商品售出數量 =0 
	public void updateReturns(Integer orderProductId) {
		int quantity=0;
		 OPDRep.updateReturns(quantity,orderProductId);
	}
	
}
