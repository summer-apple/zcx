package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.Article;
import com.zcx.bean.Store;
import com.zcx.bean.User;
import com.zcx.service.ArticleService;
import com.zcx.service.StoreService;
import com.zcx.service.UserService;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		User user1 = (User) request.getSession().getAttribute("user");
		String un="";
		String up="";
		
		
		if (user1!=null) {
			un =  user1.getUser_name();
			up = user1.getUser_pass();
		}else {
			un =  request.getParameter("user_name");
			up =  request.getParameter("user_pass");
		}
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		StoreService ss = (StoreService)wac.getBean("storeService");
		ArticleService as = (ArticleService)wac.getBean("articleService");
		//StoreService ss = (StoreService) wac.getBean("storeService");
		
		User user = us.checkUser(un, up);
		if (user!=null) {
			
			List<Article> articlelist = as.getArticleList();
			
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("articlelist", articlelist);
			
			if(user.getUser_store()!=0){
				Store store=ss.getStoreById(user.getUser_store());
				request.getSession().setAttribute("store", store);
			}
			
			if(user.getUser_head().equals("img/head/default.png")){//if user have no detail informations 
				request.getRequestDispatcher("upload_user_head.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("triangle.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("logStatus", "用户名或密码错误！");//login failure
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
