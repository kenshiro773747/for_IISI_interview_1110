package com.epicer.service.cart;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.product.Product;

//商品Dao
public interface ProductQueryRepository extends JpaRepository<Product, Integer> {

}
