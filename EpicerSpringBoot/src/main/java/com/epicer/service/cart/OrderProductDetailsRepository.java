package com.epicer.service.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderProductDetails;

//訂單明細 Dao
public interface OrderProductDetailsRepository extends JpaRepository<OrderProductDetails, Integer> {
	
	//僅會有insert(寫入不刪)
	//跟訂單總表一起寫入了
	
	
	//利用orderproductid(訂單編號)查出訂單明細
		@Query(value ="select * from order_product_details where orderproductid=?1", nativeQuery = true)
		public List<OrderProductDetails> findByOrderProductId(Integer orderProductId);
		
	//如果發生'取消訂單'(Returns) → 更新商品售出數量 =0 
		@Modifying
		@Query(value ="update order_product_details set quantity = ?1 where orderproductid=?2", nativeQuery = true)
		public void updateReturns(int quantity,Integer orderProductId);
}
