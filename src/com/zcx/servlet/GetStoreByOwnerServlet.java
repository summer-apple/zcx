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
import com.zcx.service.StoreService;

public class GetStoreByOwnerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetStoreByOwnerServlet() {
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
		
		int store_owner = Integer.parseInt(request.getParameter("store_owner"));
		System.out.println(store_owner+";;;;;;;;;;;");
		WebApplicationContext wac = WebApplicationContextUtils
	            .getRequiredWebApplicationContext(getServletContext());
		
		StoreService ss = (StoreService) wac.getBean("storeService");
		
		List<Store> storelist = (List<Store>) ss.getStoreByOwner(store_owner);
		Store store = storelist.get(0);	
		request.setAttribute("store", store);
		request.getRequestDispatcher("store.jsp").forward(request, response);
		
		
		
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
