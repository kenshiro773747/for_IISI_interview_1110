package com.epicer.controller.course;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
import com.epicer.model.course.ordercourse;
import com.epicer.service.course.CourseFeedBackService;
import com.epicer.service.course.CourseService;
import com.epicer.service.course.OrderCourseService;
import com.epicer.service.course.TeacherService;
import com.epicer.util.CSVExportUtil;
import com.epicer.util.TimeTest;

@Controller
public class TeacherController {
	
	@Autowired
	private CourseFeedBackService CFBS;

	@Autowired
	private CourseService CS;

	@Autowired
	private TeacherService TS;

	@Autowired
	private OrderCourseService ocs;

	@Autowired
	private CSVExportUtil CSVExportUtil;

	private TimeTest TT = new TimeTest();
	
	///CourseFeedBack1010///
	

	//// exportCSV////
	@GetMapping(value = "/exportcsv/{courseid}", produces = "application/json; charset=utf-8")
	public void download(HttpServletResponse response, @PathVariable("courseid") Integer courseId) {

		System.out.println("我進來了");

		List<Map<String, Object>> dataList = null;

		List<ordercourse> studentlist = ocs.findBycourseidLike(courseId);

		if (studentlist.size() == 0) {
			System.out.println("無數據導出");
		}

		String sTitle = "姓名,電話,email";
		String fName = "student_" + courseId;
		String mapKey = "name,phone,email";
		dataList = new ArrayList<>();
		Map<String, Object> map = null;

		for (ordercourse oc : studentlist) {
			map = new HashMap<>();

			map.put("name", oc.getOrdername());
			map.put("phone", oc.getOrderphone());
			map.put("email", oc.getOrderemail());
			dataList.add(map);
		}



		try (final OutputStream os = response.getOutputStream()) {
			CSVExportUtil.responseSetProperties(fName, response);
			response.setContentType("UTF-8");
			CSVExportUtil.doExport(dataList, sTitle, mapKey, os);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("完成です💜 更多更詳盡歌詞 在 ※ Mojim.com　魔鏡歌詞網");
	}
	
	
	

	/// 1003老師專用頁面///
	@GetMapping("/QueryStudentsByCourseId/{courseid}")
	@ResponseBody
	public List<ordercourse> QueryStudentsByCourseId(@PathVariable("courseid") Integer courseId) {

		List<ordercourse> studentlist = ocs.findBycourseidLike(courseId);

		List<String> list = new ArrayList<String>();

		for (ordercourse oc : studentlist) {

			System.out.println(oc.getOrdername() + " " + oc.getOrderphone() + " " + oc.getOrderemail());
			list.add(oc.getOrdername() + oc.getOrderphone() + oc.getOrderemail());
		}

		return studentlist;

	}

	/// test1003老師專用頁面///
	@GetMapping("/testQueryStudentsByCourseId/{courseid}")
	public String testQueryStudentsByCourseId(Model m, @PathVariable("courseid") Integer courseId) {

		List<ordercourse> studentlist = ocs.findBycourseidLike(courseId);
		Course thecourse = CS.getCourseById(courseId);

		System.out.println("課程ID: " + thecourse.getCourseId());

//		List<String> list = new ArrayList<String>();

		for (ordercourse oc : studentlist) {

			System.out.println(oc.getOrdername() + " " + oc.getOrderphone() + " " + oc.getOrderemail());
//			list.add(oc.getOrdername() + " " + oc.getOrderphone() + " " + oc.getOrderemail());
		}

		m.addAttribute("thecourse", thecourse);
		m.addAttribute("studentlist", studentlist);
		return "course/teacherManagePage";

////看list有啥		
//		for (String s : list) {
//			System.out.println("list有啥: " +s.strip());
//		}
	}

	/// 1003老師專用頁面///
	@GetMapping("/HelloTeacher/{teacherid}")
	public String HelloTeacher(Model m, @PathVariable("teacherid") Integer teacherid) {

		Teacher hiTeacher = TS.getTeacherById(teacherid);
		System.out.println(hiTeacher.getTeacherName());
		m.addAttribute("hiTeacher", hiTeacher);

		return "course/teacherManagePage";
	}

	/// 1002導向首頁///
	@GetMapping(path = "/777")
	public String processTeacherPage() {
		return "course/Test0930teacherPageWithFrame";
	}

	/// 1002LISTAll///
	@GetMapping(path = "/7788")
	@ResponseBody
	public List<Teacher> processMainAction() {
		List<Teacher> list = TS.findAllTeacher();
		return list;
	}

	/// 1002LIST技術test///
	@GetMapping(path = "/queryByStatus/{style}")
	@ResponseBody
	public List<Teacher> process555MainAction(Model m, @PathVariable("style") String name) {
		System.out.println("controller: " + name);

		List<Teacher> listOfStatusTeacher = TS.findTeacherByStatus(name);
		for (Teacher teacher : listOfStatusTeacher) {
			System.out.println(teacher.getTeacherName());
		}
		return listOfStatusTeacher;
	};

	/// LISTAll///
//	@GetMapping(path = "/777")
//	public String processMainAction(Model m) {
//		List<Teacher> list = TS.findAllTeacher();
//		m.addAttribute("listAll", list);
//		return "course/teacherPageWithFrame";	
//	}

	/// INSERT///
	@PostMapping(path = "/beforeTeacherInsert")
	public String beforeTeacherInsert(Model m) {
		Teacher teacher = new Teacher();
		m.addAttribute("Teacher", teacher);
		return "course/teacherInsertWithFrame";
	}

	@PostMapping(path = "/insertTeacher")
	public String insertTeacher(@ModelAttribute("Teacher") Teacher teacher, MultipartFile photo, String county,
			String district, String road) throws IllegalStateException, IOException {

		if (!photo.isEmpty()) {
			String imgName = TS.processImg(teacher.getTeacherName(), photo);
			teacher.setTeacherImage(imgName);
		} else {
			return null;
		}
		String address = county + district + road;
		System.out.println(address);
		teacher.setTeacherAddress(address);

//		String birthday = TT.TransStringToDate(teacher.getTeacherBirthday());
//		teacher.setTeacherBirthday(birthday);
		TS.insertTeacher(teacher);
		return "redirect:/777";
	}

	/// UPDATA///
	@PostMapping(path = "/beforeTeacherUpdate")
	public String beforeTeacherUpdate(@RequestParam("teacherId") int teacherId, Model m) {
		Teacher teacher = TS.getTeacherById(teacherId);
		m.addAttribute("Teacher", teacher);
		return "course/teacherEditorWithFrame";
	}

	@PostMapping(path = "/updateTeacher")
	public String updateTeacher(@ModelAttribute("Teacher") Teacher newTeacher, MultipartFile photo, String oldimg,
			String county, String district, String road) throws IllegalStateException, IOException {

		if (photo.isEmpty()) {
			newTeacher.setTeacherImage(oldimg);
		} else {
			String imgName = TS.processImg(newTeacher.getTeacherName(), photo);
			newTeacher.setTeacherImage(imgName);
			;
		}
		String address = county + district + road;
		System.out.println(address);
		newTeacher.setTeacherAddress(address);

		TS.updateTeacher(newTeacher);
		return "redirect:/777";
	}

	/// DELETE///
//	@PostMapping(path = "/deleteTeacher")
//	public String deleteTeacher(@RequestParam("teacherId") Integer teacherId) {
//		TS.deleteTeacherById(teacherId);
//		return "redirect:/777";
//	}
	
	///test1011 DELETE///
	@GetMapping(path="/deleteTeacher/{teacherId}")
	public void deleteTeacher(@PathVariable("teacherId") int teacherId) {
		TS.deleteTeacherById(teacherId);
	};
	
	

}
