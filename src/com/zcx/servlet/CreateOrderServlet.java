package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.CartStore;
import com.zcx.bean.User;
import com.zcx.service.CartService;
import com.zcx.service.OrderService;

public class CreateOrderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateOrderServlet() {
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
System.out.println("CreateOrderServlet start******************************************");
		request.setCharacterEncoding("utf-8");
		List<CartStore> cart = (List<CartStore>) request.getSession().getAttribute("cart");
		User user = (User) request.getSession().getAttribute("user");
System.out.println("cart"+cart);
System.out.println("user"+user);
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		OrderService os = (OrderService) wac.getBean("orderService");
		CartService cs = (CartService) wac.getBean("cartService");
		
		
		os.createOrder(cart, user);
		cs.cleanCart(user.getUser_id());//delete cart in database
	System.out.println(request.getSession().getAttribute("cart"));	
		request.getSession().removeAttribute("cart");//delete cart in session
	System.out.println(request.getSession().getAttribute("cart"));	
		
	request.getRequestDispatcher("GetOrderByUserServlet?order_user="+user.getUser_id()).forward(request, response);

		
		
		
System.out.println("CreateOrderServlet end******************************************");
		
		
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
