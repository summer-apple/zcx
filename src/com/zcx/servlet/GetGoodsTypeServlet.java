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

import com.zcx.bean.GoodsType;
import com.zcx.service.GoodsService;

public class GetGoodsTypeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetGoodsTypeServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
System.out.println("Get Goods Type Servlet start ********************");	
		WebApplicationContext wac = WebApplicationContextUtils          //create GoodsService
	            .getRequiredWebApplicationContext(getServletContext());
		GoodsService gs = (GoodsService) wac.getBean("goodsService");
		
		List<GoodsType> typelist = gs.getGoodsType();
System.out.println("typelist="+typelist);
		request.getSession().setAttribute("typelist", typelist);
System.out.println("Get Goods Type Servlet end ********************");		
		request.getRequestDispatcher("add_goods.jsp").forward(request, response);
	
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
