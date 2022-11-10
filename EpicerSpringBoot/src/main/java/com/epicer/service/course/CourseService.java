package com.epicer.service.course;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Course;
import com.epicer.model.course.CourseRepository;
import com.epicer.model.course.Teacher;
import com.epicer.model.course.TeacherRepository;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseRepository cRepo;

	@Autowired
	private TeacherService TS;
	
	//test1017
	public Integer query1() {
		return cRepo.query1();
	}
	
	 public Course query2() {
		 return cRepo.query2();
	 }
	 
	 public Course query3() {
		 return cRepo.query3();
	 }
	
	
	//test1005
	public List<Course> findBycourseDateGreaterThan(Long currentTime){
		return  cRepo.findBycourseDateGreaterThan(currentTime);
	};
	
	public List<Course> findBycourseDateLessThan(Long currentTime){
		return  cRepo.findBycourseDateLessThanEqual(currentTime);
	};
	
	

	// INSERT
	public Course insertCourse(Course newCourse) {

		//Teacher theTeacher = TS.getTeacherById(newCourse.getFakeTeacherID());
		//System.out.println("新增的課程id為: " + newCourse.getCourseId());
		//System.out.println("此課程老師id為: " + theTeacher.getTeacherId());

//		if (theTeacher != null) {
//			newCourse.setTeacher(theTeacher);
//		}
		return cRepo.save(newCourse);
	}

	// UPDATE
	public Course updateCourse(Course editCourse) {

//		Teacher theTeacher = TS.getTeacherById(editCourse.getFakeTeacherID());
//		System.out.println("編輯的課程id為: " + editCourse.getCourseId());
//		System.out.println("此課程老師id為: " + theTeacher.getTeacherId());
//		if (theTeacher != null) {
//			editCourse.setTeacher(theTeacher);
//		}
		return cRepo.save(editCourse);
	}

	// DELETE
	public void deleteCourseById(Integer id) {
		cRepo.deleteById(id);
	}

	// SELECTBYID
	public Course getCourseById(Integer id) {
		Optional<Course> optional = cRepo.findById(id);
		return optional.get();

	}

	// QUERYALL
	public List<Course> findAllCourse() {
		return cRepo.findAll();
	}


	//原本的存圖方法0927 07:26
//	public String processImg(String courseName , MultipartFile photoData) throws IllegalStateException, IOException {
//		
//		String filename = courseName+System.currentTimeMillis()+".jpg";
//		String saveFileDir = "C:\\Action\\worksapce\\第二組Epicer\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images";
//		File saveFilePath = new File(saveFileDir,filename);
//		photoData.transferTo(saveFilePath);
//		return filename;
//		
//	}

	// TestQUERYByCourseStyle
	public List<Course> findAllCourseByStyle(String Style) {
		return cRepo.findByCourseStyleLike(Style);
	}
	

	

	// 測試活的路徑
	public String processImg(String courseName, MultipartFile photoData) throws IllegalStateException, IOException {

		String filename = courseName + System.currentTimeMillis() + ".jpg";
		// String saveFileDir =
		// "C:\\Action\\worksapce\\第二組Epicer\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images";
		// 存入該專案的位置寫法
		String classLocalPath = this.getClass().getClassLoader().getResource("").getPath();
		String classLocalPathModify = classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes",
				"main");
		String saveFileDir = classLocalPathModify + "webapp/WEB-INF/resources/images";
		File saveFilePath = new File(saveFileDir, filename);
		photoData.transferTo(saveFilePath);
		return filename;

	}

}
