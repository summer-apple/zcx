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

import com.zcx.bean.CartStore;
import com.zcx.bean.User;
import com.zcx.service.CartService;
import com.zcx.service.OrderService;

public class BuyNowServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BuyNowServlet() {
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

System.out.println("BuyNowServlet start******************************************");
		request.setCharacterEncoding("utf-8");
		request.getSession().removeAttribute("cart");//remove session cart
		
		int cart_user = Integer.parseInt(request.getParameter("cart_user"));
System.out.println("cart_user="+cart_user);
				
				int goods_id = Integer.parseInt(request.getParameter("goods_id"));
System.out.println("goods_id="+goods_id);
				
				int cart_goods_count =Integer.parseInt(request.getParameter("cart_goods_count"));
System.out.println("cart_goods_count="+cart_goods_count);
				
				int goods_store =Integer.parseInt(request.getParameter("goods_store"));
System.out.println("goods_store="+goods_store);
		
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		CartService cs = (CartService) wac.getBean("cartService");
		OrderService os = (OrderService) wac.getBean("orderService");
		
		
		cs.cleanCart(cart_user);//delete cart in database
		
		List<CartStore> cart=cs.changeCart(null, cart_user, goods_id, cart_goods_count, goods_store);//put goods in cart
		cs.updateCart(cart);
		List<CartStore> update_cart=cs.getCartByUser(cart_user);
		
		
		request.getSession().setAttribute("cart", update_cart);
		User user=(User) request.getSession().getAttribute("user");
		
		os.createOrder(update_cart, user);
		
		
		
		request.getRequestDispatcher("GetOrderByUserServlet").forward(request, response);
		
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
