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


import com.zcx.bean.CartGoods;
import com.zcx.bean.CartStore;
import com.zcx.service.CartService;


public class ChangeCartServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeCartServlet() {
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
System.out.println("ChangeCartServlet start*******************************************");
		int cart_user = Integer.parseInt(request.getParameter("cart_user"));
System.out.println("cart_user="+cart_user);
		
		int goods_id = Integer.parseInt(request.getParameter("goods_id"));
System.out.println("goods_id="+goods_id);
		
		int cart_goods_count =Integer.parseInt(request.getParameter("cart_goods_count"));
System.out.println("cart_goods_count="+cart_goods_count);
		
		int goods_store =Integer.parseInt(request.getParameter("goods_store"));
System.out.println("goods_store="+goods_store);
		
		List<CartStore> cart = (List<CartStore>) request.getSession().getAttribute("cart");
		
System.out.println("cart="+cart);

System.out.println("user changeCart of CartServet*******************************************");
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		CartService cs = (CartService) wac.getBean("cartService");

	
		List<CartStore> return_cart = (List<CartStore>) cs.changeCart(cart, cart_user, goods_id, cart_goods_count, goods_store);
System.out.println("return_cart="+return_cart);		
		
		
		for (int i = 0; i < return_cart.size(); i++) {
			CartStore cartStore = return_cart.get(i);
			System.out.println("1"+cartStore.getCart_store_id());
			System.out.println("2"+cartStore.getCart_store_name());
			
			for (int j = 0; j < cartStore.getCart_goods_list().size(); j++) {
				CartGoods cartGoods = cartStore.getCart_goods_list().get(j);
				System.out.println("3"+cartGoods.getGoods_id());
				System.out.println("4"+cartGoods.getGoods_name());
				System.out.println("5"+cartGoods.getCart_goods_count());
				System.out.println("6"+cartGoods.getCart_user());
				System.out.println("7"+cartGoods.getGoods_head());
				System.out.println();
				System.out.println();
				
			}
		}
				
		request.getSession().setAttribute("cart", return_cart);
		
System.out.println("ChangeCartServlet end*******************************************");
		//request.getRequestDispatcher("a.jsp").forward(request, response);
	
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
