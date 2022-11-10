package com.epicer.model.course;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface courseFeedBackRepository extends JpaRepository<coursefeedback, Integer> {

	public List<coursefeedback> findBycourseid(Course course);
	
	
	
}
