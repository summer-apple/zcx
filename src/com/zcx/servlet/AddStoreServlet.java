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

import com.zcx.bean.Store;
import com.zcx.bean.User;
import com.zcx.service.StoreService;
import com.zcx.service.UserService;

public class AddStoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddStoreServlet() {
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

		
		doGet(request, response);
		
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

		request.setCharacterEncoding("utf-8");							//get the inputs
		String sn=request.getParameter("store_name");
		System.out.println(sn);
		
		User user = (User) request.getSession().getAttribute("user");
		
		int uid=user.getUser_id();
		
		System.out.println(uid);
		
		WebApplicationContext wac = WebApplicationContextUtils          //create StoreService
	            .getRequiredWebApplicationContext(getServletContext());
		StoreService ss = (StoreService) wac.getBean("storeService");
		UserService us = (UserService) wac.getBean("userService");
		
			ss.addStore(sn,uid);												//addStore
			
			Store store = ss.getStoreByOwner(uid);
			User user2 = us.getUserById(uid);
			
			
			request.getSession().setAttribute("store", store);
			request.getSession().setAttribute("user", user2);
			
			request.getRequestDispatcher("GetGoodsByStoreServlet?goods_store="+store.getStore_id()).forward(request, response);
		
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
