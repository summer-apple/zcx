package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.Address;
import com.zcx.bean.User;
import com.zcx.service.UserService;

public class UpdateUserInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateUserInfoServlet() {
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

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		User user = (User) request.getSession().getAttribute("user");
System.out.println("user_birth="+user.getUser_birth());
		String user_true_name =  request.getParameter("user_true_name");
System.out.println("user_true_name="+user_true_name);
		String user_sex = request.getParameter("user_sex");
System.out.println("user_sex="+user_sex);
		String user_phone = request.getParameter("user_phone");
System.out.println("user_phone="+user_phone);
		String user_id_card_no = request.getParameter("user_id_card_no");
System.out.println("user_id_card_no="+user_id_card_no);
		String address_province = request.getParameter("address_province");
System.out.println("address_province="+address_province);
		String address_city = request.getParameter("address_city");
System.out.println("address_city="+address_city);
		String address_district = request.getParameter("address_district");
System.out.println("address_district="+address_district);
		String address_detial = request.getParameter("address_detial");
System.out.println("address_detial="+address_detial);
		String user_birth = request.getParameter("user_birth");
System.out.println("user_birth="+user_birth);
		String user_head = request.getParameter("user_head");
System.out.println("user_head="+user_head);
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils          //create UserService
	            .getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		
		
		us.updateUserInfo(user, user_true_name, user_head,user_sex, user_phone, user_id_card_no, user_birth, address_province, address_city, address_district, address_detial);
		
		User new_user = us.getUserById(user.getUser_id());
		
		
		request.getSession().setAttribute("user", new_user);
		request.getRequestDispatcher("LoginServlet").forward(request, response);
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
