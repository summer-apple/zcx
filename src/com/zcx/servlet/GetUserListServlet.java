package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.User;
import com.zcx.service.UserService;



public class GetUserListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetUserListServlet() {
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
		User user = (User) request.getSession().getAttribute("user");
		
		WebApplicationContext wac = WebApplicationContextUtils
	            .getRequiredWebApplicationContext(getServletContext());
		
		UserService us = (UserService) wac.getBean("userService");
		
		
		if (user!=null) {
			List<User> userlist = us.getUserList(user.getUser_id());
			
			request.getSession().setAttribute("userlist", userlist);
		}else {
			List<User> userlist = us.getUserList(0);
			
			request.getSession().setAttribute("userlist", userlist);
		}
		
		
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		
		
		
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
