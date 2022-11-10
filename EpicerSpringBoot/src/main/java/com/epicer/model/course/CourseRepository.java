package com.epicer.model.course;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<Course, Integer> {
	
	//大寫測試
	public List<Course>  findByCourseStyleLike(String Style);
	
	
	//時間測試
	public List<Course> findBycourseDateGreaterThan(Long currentTime);
	
	public List<Course> findBycourseDateLessThanEqual(Long currentTime);
	
	@Query( value = " select count(*) from Course",nativeQuery = true)
	 public Integer query1();
	 
	 @Query( value = " select * from Course where coursePrice = (select MAX(coursePrice) from Course)  ",nativeQuery = true)
	 public Course query2();
	 
	 @Query( value = " select * from Course where coursePrice = (select MIN(coursePrice) from Course)",nativeQuery = true)
	 public Course query3(); 

	
}
