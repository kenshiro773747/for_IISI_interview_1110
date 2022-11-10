package com.epicer.controller.forum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;
import com.epicer.model.forum.WangEditorResponse;
import com.epicer.model.users.User;
import com.epicer.model.users.UserRespostity;
import com.epicer.service.forum.ArticleReplyService;
import com.epicer.service.forum.ArticleService;
import com.epicer.service.forum.ArticleUserRecService;
import com.epicer.service.forum.UserService;
import com.epicer.util.Mail;
import com.epicer.util.TimeTest;
import com.epicer.util.fileUtils;

@Controller
public class ArticleController {
	
	@Autowired
	private Mail mail;

	@Autowired
	private ArticleService aService;

	@Autowired
	private ArticleReplyService arService;

	
	@Autowired
	private ArticleUserRecService aurService;
	
	@Autowired
	private UserService uService;

	@Autowired
	private UserRespostity uRepo;
	
	@Autowired
	private HttpSession session;


	@GetMapping("/QueryAllPage")
	public String QueryAllPage() {
		return "forum/adminforumpage";
	}

	@GetMapping("/QueryAllAjax")
	@ResponseBody
	public List<ArticleBean> QueryAllAjax() {
		return aService.findAll();
	}

	@PostMapping("/QueryNameAjax")
	@ResponseBody
	public List<ArticleBean> QueryNameAjax(String title) {
		return aService.findByTitleLike("%"+title+"%");
	}

	@PostMapping("/QueryCategoryAjax")
	@ResponseBody
	public List<ArticleBean> QueryCategoryAjax(int categoryId) {
		return aService.findByCategory(categoryId);
	}
	
	
	@PostMapping("/QueryReplyReport")
	@ResponseBody
	public List<ArticleReplyBean> QueryReplyReport(int status) {
		return arService.findAllByStatus(status);
	}
	
	@PostMapping("/QueryArticleReport")
	@ResponseBody
	public List<ArticleBean> QueryArticleReport(int status) {
		return aService.findByStatus(status);
	}

	@GetMapping("/forumAdd")
	public String forumAddPage() {
		return "forum/forumAdd";
	}

	@PostMapping("/articleAdd")
	public String articleAdd(int category, String articleTitle, String articleContent) {
		int userId = (int) session.getAttribute("userId");
		ArticleBean article = new ArticleBean();
		article.setPlateformCategoryId(category);
		article.setTitle(articleTitle);
		article.setDate(TimeTest.getTime());
		article.setArticleContent(articleContent);
		if(userId==1006){
			article.setStatus(2);}
		else {
			article.setStatus(0);
		}
		article.setArticleLike(0);
		article.setArticleViews(0);
		article.setArticleReplys(0);
		ArticleUserBean userID = uService.findByUserId(userId);
		article.setUser(userID);
		aService.insert(article);
		return "redirect:/QueryAllPage";
	}

	@PostMapping("/forumUpdatePage")
	public String forumUpdatePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumUpdate";
	}
	@PostMapping("/forumAdminUpdatePage")
	public String forumAdminUpdatePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumAdminUpdate";
	}
	
	@PostMapping("/forumReport")
	public String forumReport(int number) {
		aService.insertReport(1,number);
		ArticleBean auser = aService.findByArticleId(number);
		ArticleUserBean user= auser.getUser();
		int userId =user.getUserId();
		
		User u = uRepo.findUser(userId);
		mail.forumSendToGmail(u.getAccount());
		return "redirect:/QueryAllPage";
	}
	@PostMapping("/announcement")
	public String announcement(int number) {
		aService.insertReport(2,number);
//		mail.forumSendToGmail(mail);
		return "redirect:/QueryAllPage";
	}
	
	
	@PostMapping("/articleReportUpdate")
	public String articleUpdate(int status,int articleId) {
		aService.updateReport(status, articleId);
		return "redirect:/QueryAllPage";
	}
	
	

	@PostMapping("/articleUpdate")
	public String articleUpdate(int articleId, String aTitle, String aContent,int status,int replys,int views,int likes) {
		ArticleBean article = new ArticleBean();
		int userId = (int) session.getAttribute("userId");
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		ArticleUserBean userID = uService.findByUserId(userId);
		article.setUser(userID);
		article.setArticleContent(aContent);
		article.setDate(TimeTest.getTime());
		article.setStatus(status);
		article.setArticleLike(likes);
		article.setArticleReplys(replys);
		article.setArticleViews(views);
		aService.insert(article);
		return "redirect:/QueryAllPage";
		
	}

	@PostMapping("/articleDetail")
	public String articleDetail(Integer articleId) {
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		session.setAttribute("selectDetail", selectDetail);
		
		int views =selectDetail.getArticleViews();
		views++;
		aService.updateViews(views, articleId);
		
		return "forum/adminfourmDetail";
	}
	
	
	
	
	@PostMapping("/replyDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyDetail(int articleId,String replyContent) {
		
		int userId = (int) session.getAttribute("userId");
		ArticleUserBean userID = uService.findByUserId(userId);
		ArticleBean articleID = aService.findByArticleId(articleId);
		ArticleReplyBean articleReply = new ArticleReplyBean();
		articleReply.setArticleId(articleID);
		articleReply.setUser(userID);
		articleReply.setArticleReplyContent(replyContent);
		articleReply.setArticleReplyDate(TimeTest.getTime());
		articleReply.setStatus(0);
		
		arService.insert(articleReply);
		
		int replys= aService.CountReply(articleId);
		aService.updateCountReply(replys, articleId);
		
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(replyid);
		return selectReplyAll ;
	}
	
	@PostMapping("/replyEmptyDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyEmptyDetail(int articleId) {
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(replyid);
		return selectReplyAll ;
	}
	
	

	@PostMapping("/articleDelete")
	@ResponseStatus(HttpStatus.OK)
	public void articleDelete(int number) {
		aService.deleteById(number);
	}
	


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	@PostMapping("/replyDelete")
	@ResponseStatus(HttpStatus.OK)
	public void replyDelete(int replyId, int articleId) {
		arService.deleteById(replyId);
		int replys= aService.CountReply(articleId);
		aService.updateCountReply(replys, articleId);
	}

	@PostMapping("/replyUpdatePage")
	public String replyUpdatePage(int replyId) {
		ArticleReplyBean replyUpdateDetail = arService.findById(replyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forum/forumReplyUpdate";
	}

	@PostMapping("/replyUpdate")
	public String replyUpdate(int articleId, int replyId, String replyContent) {

		arService.updateobject(replyContent, TimeTest.getTime(), replyId);
		
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(selectDetail);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forum/adminfourmDetail";
	}
	
	@PostMapping("/replyAdminUpdatePage")
	public String replyAdminUpdatePage(int articleReplyId) {
		ArticleReplyBean replyUpdateDetail = arService.findById(articleReplyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forum/forumAdminReplyUpdate";
	}

	@PostMapping("/replyAdminUpdate")
	public String replyAdminUpdate(int status,int replyId) {
		System.out.println(status);
		System.out.println(replyId);
		arService.updateReport(status, replyId);
		return "redirect:/QueryAllPage";
	}

	
	@PostMapping("/replyReport")
	public String ReplyReport(int replyId , int articleId) {
		arService.insertReport(1,replyId);
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		ArticleBean reply  = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(reply);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forward:/articleDetail";
	}
	

//////////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	@GetMapping("/QueryUserArticle")
	@ResponseBody
	public List<ArticleBean> QueryUserArticle() {
		int userId = (int) session.getAttribute("userId");
		
		List<ArticleBean> artilces = new ArrayList<>();
		
		ArticleUserBean userID = uService.findByUserId(userId);
		
		Iterable<ArticleBean> selectUserId = aService.findByUser(userID);
		System.out.println(selectUserId);
		for (ArticleBean article : selectUserId) {
			artilces.add(article);
		}
		return artilces;

	}

	@GetMapping("/QueryUserReply")
	@ResponseBody
	public List<ArticleReplyBean> QueryUserReply() {
		int userId = (int) session.getAttribute("userId");
		List<ArticleReplyBean> artilceReplys = new ArrayList<>();
		ArticleUserBean userID = uService.findByUserId(userId);
		List<ArticleReplyBean> UserReply = arService.findAllByUserId(userID);
		for (ArticleReplyBean article : UserReply) {
			artilceReplys.add(article);
		}
		return artilceReplys;
	}
	/**
	 * 收藏功能
	 * @param articleId
	 * @return
	 */
	@PostMapping("/insertCollect")
	@ResponseStatus(HttpStatus.OK)
	public void addRec(int articleId) {
		ArticleCollectRecBean rec = new ArticleCollectRecBean();
		
		int userId = (int) session.getAttribute("userId");
		ArticleBean articleID = aService.findByArticleId(articleId);
		
		rec.setArticleId(articleID);
		rec.setUser(userId);
		
		aurService.insert(rec);
		int likes = aService.CountLike(articleId);
		aService.updateLike(likes, articleId);
	}
	
	@PostMapping("/delCollect")
	@ResponseStatus(HttpStatus.OK)
	public void delRec(int articleId) {
		int userId = (int) session.getAttribute("userId");
		aurService.delete(articleId,userId);
		int likes = aService.CountLike(articleId);
		aService.updateLike(likes, articleId);
	}
	
	
	@PostMapping("/CollectStatus")
	@ResponseBody
	public boolean CollectStatus(int articleId) {
		int userId = (int) session.getAttribute("userId");
		if(Integer.parseInt(aurService.statusRec(articleId,userId)) >0) {
			return true;
		}
		return false;
	}
	
	@GetMapping("/QueryRec")
	@ResponseBody
	public List<ArticleCollectRecBean> QueryRec() {
		int userId = (int) session.getAttribute("userId");
		return aurService.findRec(userId);
	}
	
	@PostMapping("/UserdelRec")
	public String UserdelRec(int articleId) {
		int userId = (int) session.getAttribute("userId");
		aurService.delete(articleId,userId);
		return "redirect:/forumUser";
	}
	
	
	

	@PostMapping("/UserUpdateArticlePage")
	public String UserUpdateArticlePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumUserArticleUpdate";
	}

	@PostMapping("/UserUpdateArticle")
	public String UserUpdateArticle(int articleId, String aTitle, String aContent) {
		int userId = (int) session.getAttribute("userId");
		ArticleBean article = new ArticleBean();
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		ArticleUserBean userID = uService.findByUserId(userId);
		article.setUser(userID);
		article.setArticleContent(aContent);
		article.setDate(TimeTest.getTime());
		aService.insert(article);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserDeleteArticle")
	public String UserDeleteArticle(int number) {
		aService.deleteById(number);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserDeleteReply")
	public String UserDeleteReply(int replyId) {
		arService.deleteById(replyId);
		return "redirect:/forumUser";
	}

	@PostMapping("/UserUpdateReplyPage")
	public String UserUpdateReplyPage(int replyId) {
		ArticleReplyBean replyUserUpdateDetail = arService.findById(replyId);
		session.setAttribute("replyUserUpdateDetail", replyUserUpdateDetail);
		return "forum/forumUserReplyUpdate";
	}

	@PostMapping("/UserUpdateReply")
	public String UserUpdateReply(int replyId, String replyContent) {
//		ArticleReplyBean articleReply = new ArticleReplyBean();
//		articleReply.setArticleReplyId(replyId);
//		articleReply.setArticleReplyContent(replyContent);
//		articleReply.setArticleReplyDate(TimeTest.getTime());
//		arService.insert(articleReply);
		
		arService.updateobject(replyContent, TimeTest.getTime(), replyId);
		return "redirect:/forumUser";
	}

	@RequestMapping(value = "/images", produces = { "application/json; charset=UTF-8" })
	@ResponseBody // application/json
	public Object test1(@RequestParam("img") MultipartFile file, Map<String, Object> map, HttpServletRequest request)
			throws IOException {
		// 使用uuid解决文件重名
		
		String classLocalPath =this.getClass().getClassLoader().getResource("").getPath();
		String classLocalPathModify= classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir= classLocalPathModify+"/webapp/WEB-INF/resources/images/";

		
		String outpath = saveFileDir+ UUID.randomUUID().toString().replaceAll("-", "");
				
		byte[] bytes = file.getBytes();
		// 读取文件路径
		String path = request.getServletContext().getRealPath("/webapp/WEB-INF/resources/images/");
		// 如果不存在则新建
		File imgFile = new File(path);
		if (!imgFile.exists()) {
			imgFile.mkdirs();
		}
		String fileName = file.getOriginalFilename();// 文件名称
		// 对文件进行写入
		try (FileOutputStream fos = new FileOutputStream(new File(path + fileName))) {
			fos.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 這方法照片要重新刷新才能顯示 // String value = "images/"
		// +outpath.substring(outpath.lastIndexOf("\\")+1)+ fileName;
		String value = outpath.substring(outpath.lastIndexOf("\\")+1)+ fileName;
		// 保存到服务器目录，记录名称地址
		fileUtils.upload(file, outpath, file.getOriginalFilename());
		map.put("imgName", fileName);
		map.put("imgUrl", outpath + fileName);
		System.out.println(map);
		// 返回信息上传
		return new WangEditorResponse("1", Arrays.asList(StringUtils.substringAfterLast(value, "resources/")));

	}
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// EPICER測試前台登入頁面
	// 連線網址路徑: http://localhost:8091/firstfrontindex
	@GetMapping("/formFirstFrontIndex")
	public String processFristFrontIndexAction() {
		return "forum/formFrontIndex";
	}
	
	@PostMapping("/articleFrontDetail")
	public String articleFrontDetail(Integer articleId) {
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		session.setAttribute("selectDetail", selectDetail);
		
		int views =selectDetail.getArticleViews();
		views++;
		aService.updateViews(views, articleId);
		
		return "forum/formFrontIndexDetail";
	}
	
	@GetMapping("/articleFrontDetails")
	public String articleFrontDetails(Integer articleId) {
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		session.setAttribute("selectDetail", selectDetail);
		
		int views =selectDetail.getArticleViews();
		views++;
		aService.updateViews(views, articleId);
		
		return "forum/formFrontIndexDetail";
	}
	
	@PostMapping("/articleAjaxtDetail")
	@ResponseBody
	public ArticleBean articleAjaxtDetail(Integer articleId) {
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		return selectDetail;
	}
	
	
	
	
	@PostMapping("/replyFrontDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyFrontDetail(int articleId,String replyContent) {
		
		int userId = (int) session.getAttribute("userId");
		ArticleUserBean userID = uService.findByUserId(userId);
		ArticleBean articleID = aService.findByArticleId(articleId);
		ArticleReplyBean articleReply = new ArticleReplyBean();
		articleReply.setArticleId(articleID);
		articleReply.setUser(userID);
		articleReply.setArticleReplyContent(replyContent);
		articleReply.setArticleReplyDate(TimeTest.getTime());
		articleReply.setStatus(0);
		
		arService.insert(articleReply);
		
		int replys= aService.CountReply(articleId);
		aService.updateCountReply(replys, articleId);
		
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.frontFindAllByArticleId(replyid);
		return selectReplyAll ;
	}
	
	@PostMapping("/replyFrontEmptyDetail")
	@ResponseBody
	public List<ArticleReplyBean> replyFrontEmptyDetail(int articleId) {
		ArticleBean replyid = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.frontFindAllByArticleId(replyid);
		return selectReplyAll ;
	}
	
	
	@GetMapping("/frontQueryAllAjax")
	@ResponseBody
	public List<ArticleBean> FrontQueryAllAjax() {
		return aService.frontFindByStatus();
	}

	@PostMapping("/frontQueryNameAjax")
	@ResponseBody
	public List<ArticleBean> frontQueryNameAjax(String title) {
		return aService.frontFindAllByTitleLike("%"+title+"%");
	}

	@PostMapping("/frontQueryCategoryAjax")
	@ResponseBody
	public List<ArticleBean> frontQueryCategoryAjax(int categoryId) {
		return aService.frontFindAllByPlateformCategoryId(categoryId);
	}
	
	
	
	
	
	@GetMapping("/forntForumAdd")
	public String forntForumAdd() {
		return "forum/forumFrontAdd";
	}

	@PostMapping("/forntArticleAdd")
	public String forntForumAdd(int category, String articleTitle, String articleContent) {
		ArticleBean article = new ArticleBean();
		article.setPlateformCategoryId(category);
		article.setTitle(articleTitle);
		article.setDate(TimeTest.getTime());
		article.setArticleContent(articleContent);
		article.setStatus(0);
		article.setArticleLike(0);
		article.setArticleViews(0);
		article.setArticleReplys(0);
		int userId = (int) session.getAttribute("userId");
		ArticleUserBean userID = uService.findByUserId(userId);
		article.setUser(userID);
		aService.insert(article);
		return "redirect:/formFirstFrontIndex";
	}
	
	
	@PostMapping("/forumFrontUpdatePage")
	public String forumFrontUpdatePage(int articleId) {
		ArticleBean updateDetail = aService.findByArticleId(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forum/forumFrontUpdate";
	}

	@PostMapping("/frontArticleUpdate")
	public String frontArticleUpdate(int articleId, String aTitle, String aContent,int status,int replys,int views,int likes) {
		ArticleBean article = new ArticleBean();
		int userId = (int) session.getAttribute("userId");
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		ArticleUserBean userID = uService.findByUserId(userId);
		article.setUser(userID);
		article.setArticleContent(aContent);
		article.setDate(TimeTest.getTime());
		article.setStatus(status);
		article.setArticleLike(likes);
		article.setArticleReplys(replys);
		article.setArticleViews(views);
		aService.insert(article);
		return "redirect:/formFirstFrontIndex";
		
	}
	
	@PostMapping("/frontReplyUpdatePage")
	public String frontReplyUpdatePage(int replyId) {
		ArticleReplyBean replyUpdateDetail = arService.findById(replyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forum/forumFrontReplyUpdate";
	}

	@PostMapping("/frontReplyUpdate")
	public String frontReplyUpdate(int articleId, int replyId, String replyContent) {

		arService.updateobject(replyContent, TimeTest.getTime(), replyId);
		
		ArticleBean selectDetail = aService.findByArticleId(articleId);
		List<ArticleReplyBean> selectReplyAll = arService.findAllByArticleId(selectDetail);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forum/formFrontIndexDetail";
	}
	
	

	@GetMapping("/forumUser")
	public String forumUser() {
		return "forum/formFrontRec";
	}
	
	
	
}
