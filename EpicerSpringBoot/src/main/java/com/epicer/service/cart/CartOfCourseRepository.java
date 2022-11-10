package com.epicer.service.cart;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.cart.CartOfCourse;
import com.epicer.model.cart.CartOfProduct;

//課程購物車Dao
public interface CartOfCourseRepository extends JpaRepository<CartOfCourse, Integer> {

	// 查出cartcourseid
	// 原生SQL-查cartcourseid (一個購物車僅能一位報名)
	@Query(value = "select * from cart_course_details where userid= ?1", nativeQuery = true)
	public Optional<CartOfCourse> getCartCourseId(Integer userId);

	//利用userId查出整個購物車
	@Query(value ="select * from cart_course_details where userid=?1", nativeQuery = true)
	public List<CartOfCourse> findByCartUser(Integer userId);
	
	//清空購物車(by userid)
	@Modifying
	@Query(value ="delete from cart_course_details where userid=?1", nativeQuery = true)
	public List<CartOfCourse> deleteUserCart(Integer userId);
	
}


