package com.epicer.controller.course;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Course;
import com.epicer.model.course.Teacher;
import com.epicer.service.course.CourseService;
import com.epicer.service.course.TeacherService;
import com.epicer.util.TimeTest;

@Controller
public class CourseController {

	@Autowired
	private CourseService CS;
	
	@Autowired
	private TeacherService TS;
	
	
	private TimeTest TT = new TimeTest();
	
	//Test1015char.js
		@PostMapping
		@ResponseBody
		public String getStudentCount() {
			
		return 	"123";
		}
	
	
	//TEST1015
	@GetMapping(path="/courseMain")
	public String processCourseMainManage(Model m) {
		Integer q1 = CS.query1();	
		System.out.println("q1: "+q1);
		Course q2 = CS.query2();		
		System.out.println("q2: "+q2.getCourseName());
		Course q3 = CS.query3();
		System.out.println("q3: "+q3.getCourseName());
		
		
		
		m.addAttribute("q1",q1);
		m.addAttribute("q2",q2);
		m.addAttribute("q3",q3);
		
		return "course/CourseMainManage";
	}
	
	
	//test1011 測試各種前端版  shopsidebar
	@GetMapping(path="123")
	public String processshopsidebar() {
		
		return "course/shopsidebar";
	}
	
	
	//test1010商品頁面依類別分類
	@PostMapping("/queryshopbystyle")
	public String queryshopbystyle(@RequestParam("style") String style, Model m) {
		
		List<Teacher> tlist = TS.findAllTeacher();
		m.addAttribute("tlist",tlist);
		
		List<Course> list = CS.findAllCourseByStyle(style);
		m.addAttribute("listAll",list);
		return "course/courseshop";
		
	}
	
	
	//test1010全部商品頁面
	@GetMapping("/555")
	public String processcourseshop(Model m ) {
		List<Course> list = CS.findAllCourse();
		m.addAttribute("listAll",list);
		
		List<Teacher> tlist = TS.findAllTeacher();
		for(Teacher t :tlist) {
			System.out.println("123TeacherName: "+t.getTeacherName());
		}
		m.addAttribute("tlist",tlist);
		return "course/courseshop";		
		
	}
	
	//test1010單一商品頁面
	@GetMapping("")
	public String processcourseproduct(@PathVariable("courseid") int courseid , Model m) {
		Course c = CS.getCourseById(courseid);
		m.addAttribute("courseWithId",c);	
		return "course/courseproductsingle";	
	}
	
	//1010post方法
	@PostMapping("/999")
	public String processproduct(@RequestParam("courseid") int courseid , Model m) {
		
		Course c = CS.getCourseById(courseid);
		System.out.println("進來沒: " + courseid);
		m.addAttribute("courseWithId",c);
		
		
		
		List<Course> list = CS.findAllCourseByStyle(c.getCourseStyle());
		m.addAttribute("listAll",list);
		
		return "course/productsingle";	
	}
	
	
	
	////篩選尚未開始的課程///
	@GetMapping(path = "/querycourseaftercurrenttime/{currenttime}")
	@ResponseBody
	public Object[] processcourseaftercurrenttime(Model m ,@PathVariable("currenttime") Long currenttime ) {
		
		List<Course> listWithStyle = CS.findBycourseDateGreaterThan(currenttime);
		List<Teacher> listTeacher = new ArrayList<Teacher>();
		for (Course course : listWithStyle) {
			System.out.println(course.getTeacher().getTeacherImage()); 
			listTeacher.add(course.getTeacher());
			String coursetime = TT.transToDate(course.getCourseDate());				
			System.out.println("step1 coursetime: " + coursetime); 			
			course.setFakeCourseDate(coursetime);
			System.out.println("step2 FakeCourseDate: " + course.getFakeCourseDate() ); 			
		}
		System.out.println(listTeacher.size());
		Object [] mix = {listWithStyle,listTeacher};
		return mix;
		
	};
	
	////篩選已經結束的課程///
	@GetMapping(path = "/querycoursebeforecurrenttime/{currenttime}")
	@ResponseBody
	public Object[] processcoursebeforecurrenttime(Model m ,@PathVariable("currenttime") Long currenttime ) {
		
		List<Course> listWithStyle = CS.findBycourseDateLessThan(currenttime);
		List<Teacher> listTeacher = new ArrayList<Teacher>();
		for (Course course : listWithStyle) {
			System.out.println(course.getTeacher().getTeacherImage()); 
			listTeacher.add(course.getTeacher());
			String coursetime = TT.transToDate(course.getCourseDate());				
			System.out.println("step1 coursetime: " + coursetime); 			
			course.setFakeCourseDate(coursetime);
			System.out.println("step2 FakeCourseDate: " + course.getFakeCourseDate() ); 			
		}
		System.out.println(listTeacher.size());
		Object [] mix = {listWithStyle,listTeacher};
		return mix;
		
	};
	
	
	
	///導向首頁///
	@GetMapping(path = "/666")
	public String processCoursePage() {
		return "course/Test0928coursePageWithFrame";
	};

	///LISTAll///
	@GetMapping(path = "/5566")
	@ResponseBody
	public Object[] processMainAction(Model m) {
		List<Course> list = CS.findAllCourse();
		List<Teacher> listTeacher = new ArrayList<Teacher>();
		for (Course course : list) {
			System.out.println(course.getTeacher().getTeacherImage()); 
			listTeacher.add(course.getTeacher());
			String coursetime = TT.transToDate(course.getCourseDate());				
			System.out.println("step1 coursetime: " + coursetime); 			
			course.setFakeCourseDate(coursetime);
			System.out.println("step2 FakeCourseDate: " + course.getFakeCourseDate() ); 			
		}
		System.out.println(listTeacher.size());
		Object [] mix = {list,listTeacher};
		
		return mix;
	};

	///LIST技術///
//		@GetMapping(path = "/queryByCourseStyle/{style}")
//		public String process555MainAction(Model m ,@PathVariable("style") String name ) {
//			List<Course> listWithStyle = CS.findAllCourseByStyle(name);
//			m.addAttribute("listAll", listWithStyle);
//			for (Course course : listWithStyle) {
//				System.out.println(course.getCourseName());
//			}
//			
//			return "course/Test0928coursePageWithFrame";
//		};
		
	///0929LIST技術test///
		@GetMapping(path = "/queryByCourseStyle/{style}")
		@ResponseBody
		public Object[] process555MainAction(Model m ,@PathVariable("style") String name ) {
			System.out.println("controller: "+name);
			List<Course> listWithStyle = CS.findAllCourseByStyle(name);
			List<Teacher> listTeacher = new ArrayList<Teacher>();
			for (Course course : listWithStyle) {
				System.out.println(course.getTeacher().getTeacherImage()); 
				listTeacher.add(course.getTeacher());
				String coursetime = TT.transToDate(course.getCourseDate());				
				System.out.println("step1 coursetime: " + coursetime); 			
				course.setFakeCourseDate(coursetime);
				System.out.println("step2 FakeCourseDate: " + course.getFakeCourseDate() ); 			
			}
			System.out.println(listTeacher.size());
			Object [] mix = {listWithStyle,listTeacher};
			return mix;
			
		};
	
	
	
	

	///1006testckeditorINSERT///
	@PostMapping(path = "/beforeCourseInsert")
	public String beforeCourseInsert(Model m) {

		Course course = new Course();
		m.addAttribute("Course", course);
///////		
		List<Teacher> list = TS.findAllTeacher();
		m.addAttribute("listAll", list);
////////
		return "course/Test1006courseInsertWithCKeditor";
		
	};

//	@PostMapping(path = "/addCourse")
//	public String insertCourse(@ModelAttribute("Course") Course course , MultipartFile photo) throws IllegalStateException, IOException {
//
//		System.out.println("我在controller測試新增物件抓取 : " + course.getClassroomId());
//		System.out.println("123" +photo.isEmpty());
//		
//		
//		
//		 Long courseDate = TT.getLongFromString(course.getFakeCourseDate());		 
//		 course.setCourseDate(courseDate);
//		
//		if (!photo.isEmpty()) {
//			String imgName = CS.processImg(course.getCourseName(), photo);
//			course.setCourseImage(imgName);
//		}else {
//			return null;
//		}
//		CS.insertCourse(course);
//		return "redirect:/666";
//	};
	
	
	////1015測試///
	@PostMapping(path = "/addCourse")
	public String insertCourse(@ModelAttribute("Course") Course course , MultipartFile photo,String getTeacherByName) throws IllegalStateException, IOException {

		System.out.println("我在controller測試新增物件抓取 : " + course.getClassroomId());
		System.out.println("123" +photo.isEmpty());
		
		Teacher insertTeacher = TS.queryByTeacherName(getTeacherByName);
		System.out.println("老師: "+insertTeacher.getTeacherId()+" "+insertTeacher.getTeacherName());
		course.setTeacher(insertTeacher);
			
		Long courseDate = TT.getLongFromString(course.getFakeCourseDate());		 
		course.setCourseDate(courseDate);
		
		if (!photo.isEmpty()) {
			String imgName = CS.processImg(course.getCourseName(), photo);
			course.setCourseImage(imgName);
		}else {
			return null;
		}
		CS.insertCourse(course);
		return "redirect:/666";
	};
	

	///UPDATA///
	@PostMapping(path = "/beforeUpdateCourse")
	public String beforecourseEditor(@RequestParam("courseId") int courseId, Model m) {

		Course course = CS.getCourseById(courseId);
		m.addAttribute("Course", course);
		
	///////		
			List<Teacher> list = TS.findAllTeacher();
			m.addAttribute("listAll", list);
	////////

		return "course/Test1006courseEditorWithCKeditor";
	};

	@PostMapping(path = "/updateCourse")
	public String UpdateCourse(@ModelAttribute("Course") Course newCourse,MultipartFile photo,String oldimg,String getTeacherByName) throws IllegalStateException, IOException {
			
		Teacher insertTeacher = TS.queryByTeacherName(getTeacherByName);
		System.out.println("老師: "+insertTeacher.getTeacherId()+" "+insertTeacher.getTeacherName());
		newCourse.setTeacher(insertTeacher);
		
		
		System.out.println("測試更新抓取時間:"+ " " + newCourse.getFakeCourseDate());	
		Long courseDate = TT.getLongFromString(newCourse.getFakeCourseDate());		 
		newCourse.setCourseDate(courseDate);
		
		if (photo.isEmpty()) {
			newCourse.setCourseImage(oldimg);
		}else {
			String imgName = CS.processImg(newCourse.getCourseName(), photo);
			newCourse.setCourseImage(imgName);		
		}
		CS.updateCourse(newCourse);
		return "redirect:/666";
	};
	
//	@PostMapping(path = "/updateCourse")
//	public String UpdateCourse(@ModelAttribute("Course") Course newCourse,MultipartFile photo,String oldimg,String localdatetime) throws IllegalStateException, IOException {
//			
//		System.out.println("123測試更新抓取時間:"+ " " + localdatetime);
//		
//		Long courseDate = TT.getLongFromString(localdatetime);		 
//		newCourse.setCourseDate(courseDate);
//		
//		if (photo.isEmpty()) {
//			newCourse.setCourseImage(oldimg);
//		}else {
//			String imgName = CS.processImg(newCourse.getCourseName(), photo);
//			newCourse.setCourseImage(imgName);		
//		}
//		CS.updateCourse(newCourse);
//		return "redirect:/666";
//	};
	

	///1006originDELETE///
//	@PostMapping(path = "/deleteCourse")
//	public String deleteCourse(@RequestParam("courseId") int courseId) {
//		CS.deleteCourseById(courseId);
//		return "redirect:/666";
//	};
	
	///1006sweetalertDELETE///
	@GetMapping(path = "/deleteCourse/{courseId}")
	public void deleteCourse(@PathVariable("courseId") int courseId) {
		CS.deleteCourseById(courseId);
	};
	
	///SELECT///
	@PostMapping(path = "/selectCourse")
	public String selectCourseById(Integer id) {
		
		Course course = CS.getCourseById(id);
		
		return "redirect:/666";
		
	}

}
