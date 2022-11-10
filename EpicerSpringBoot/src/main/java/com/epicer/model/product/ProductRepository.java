package com.epicer.model.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	public List<Product> findByProductCategoryId(Integer productCategoryId);
	
	public List<Product> findByProductStatus(Integer productStatus);
	
	public List<Product> findByProductHot(Integer productHot);
	
	@Query( value = " select count(*) from product",nativeQuery = true)
	public Integer query1();
	
	@Query( value = " select * from product where productprice = (select MAX(productprice) from product)  ",nativeQuery = true)
	public Product query2();
	
	@Query( value = " select * from product where productprice = (select MIN(productprice) from product)",nativeQuery = true)
	public Product query3();
//	統計類別中有幾個產品
	@Query( value = " select count(*) from product where productcategoryid =?1",nativeQuery = true)
	public Integer query5(Integer productCategoryId);
//	統計不同產地有幾個產品
	@Query( value = " select count(*) from product where productorigin =?1",nativeQuery = true)
	public Integer query6(String productOrigin);
}
