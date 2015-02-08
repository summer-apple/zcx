package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import atg.taglib.json.util.JSONException;
import atg.taglib.json.util.JSONObject;

import com.zcx.bean.CartGoods;
import com.zcx.bean.CartStore;
import com.zcx.service.CartService;

public class GetCartByUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetCartByUserServlet() {
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
System.out.println("GerCartByUser start**************************");		
		request.setCharacterEncoding("utf-8");
		
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		WebApplicationContext wac = WebApplicationContextUtils
	            .getRequiredWebApplicationContext(getServletContext());
		
		CartService cs = (CartService) wac.getBean("cartService");
		
		List<CartStore> cart = (List<CartStore>) cs.getCartByUser(user_id);
System.out.println("get cart by user service return cart"+cart);		
		

		request.getSession().setAttribute("cart", cart);
		
		
		
		
		
		//calculate the cart amount
		
		double cart_amount = 0;	
		if (cart!=null) {
			for (int i = 0; i < cart.size(); i++) {
				CartStore cartStore = cart.get(i);
				
				
				for (int j = 0; j < cartStore.getCart_goods_list().size(); j++) {
					CartGoods cartGoods = cartStore.getCart_goods_list().get(j);
					
					cart_amount+= cartGoods.getCart_goods_count()*cartGoods.getGoods_price();
					
					
				}
			}
		}else {
			cart_amount=0.00;
		}
		
		
		DecimalFormat df = new DecimalFormat("#.00");
	    String format_amount=df.format(cart_amount);
	    
		System.out.println("cart_amount="+format_amount);
		request.getSession().setAttribute("cart_amount", format_amount);
		
System.out.println("GerCartByUser end**************************");		
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		
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
