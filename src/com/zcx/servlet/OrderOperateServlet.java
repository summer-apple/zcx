package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.Order;
import com.zcx.service.OrderService;

public class OrderOperateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderOperateServlet() {
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
		String order_id = request.getParameter("order_id");
		String order_state = request.getParameter("order_state");
System.out.println("order_id="+order_id);
System.out.println("order_state="+order_state);

		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		OrderService os = (OrderService) wac.getBean("orderService");
		
		Order order = null;
		
		if (order_state.equals("待确认")) {
			order = os.confirmOrder(order_id);
		}else if(order_state.equals("已确认")) {
			order = os.payOrder(order_id);
		}else if(order_state.equals("已付款")) {
			order = os.outOrder(order_id);
		}else if(order_state.equals("已发货")) {
			order = os.acceptOrder(order_id);
		}
		
		request.getSession().setAttribute("order", order);
		//request.getRequestDispatcher("order_detial.jsp").forward(request, response);
		
		
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
