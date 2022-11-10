package com.epicer.service.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.course.Course;
import com.epicer.model.course.orderCourseRepository;
import com.epicer.model.course.ordercourse;

@Service
@Transactional
public class OrderCourseService {
	
	@Autowired
	private orderCourseRepository ocRepo;
	
	@Autowired
	private CourseService cs;
	
	///從id取得課程報名學生資訊///
	public List<ordercourse> findBycourseidLike(Integer courseId) {
		
		Course c = cs.getCourseById(courseId);
		
		return ocRepo.findBycourseidLike(c);
			
	}
	
	
	
	
	

}
