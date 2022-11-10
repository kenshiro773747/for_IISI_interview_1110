package com.epicer.model.course;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

	//大寫測試
	public List<Teacher>  findByTeacherStatus(String Style);
	
	public Teacher findByTeacherName(String teacher);
	
}
