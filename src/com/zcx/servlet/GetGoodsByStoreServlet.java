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

import com.zcx.bean.Goods;
import com.zcx.service.GoodsService;

public class GetGoodsByStoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetGoodsByStoreServlet() {
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
		
		int goods_store = Integer.parseInt(request.getParameter("goods_store"));
		
		WebApplicationContext wac = WebApplicationContextUtils
	            .getRequiredWebApplicationContext(getServletContext());
		
		GoodsService gs = (GoodsService) wac.getBean("goodsService");
		
		List<Goods> goodslist = (List<Goods>) gs.getGoodsByStore(goods_store);
		
		request.setAttribute("goodslist", goodslist);
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
