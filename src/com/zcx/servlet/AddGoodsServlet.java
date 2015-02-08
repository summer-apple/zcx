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
import com.zcx.bean.GoodsType;
import com.zcx.bean.User;
import com.zcx.service.GoodsService;

public class AddGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddGoodsServlet() {
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
		
		String goods_name=request.getParameter("goods_name");
		double goods_price=Double.parseDouble(request.getParameter("goods_price"));	
		int goods_count=Integer.parseInt(request.getParameter("goods_count"));		
		String goods_onsale=request.getParameter("goods_onsale");	
		String goods_describe=request.getParameter("goods_describe");	
		String goods_head = request.getParameter("goods_head");
		User user = (User) request.getSession().getAttribute("user");
		int goods_store= user.getUser_store();
		
		int goods_type= Integer.parseInt(request.getParameter("goods_type"));
		int goods_area= Integer.parseInt(request.getParameter("goods_area"));
		
	
//		Goods goods=new Goods();
//		goods.setGoods_name(goods_name);
//		goods.setGoods_price(goods_price);
//		goods.setGoods_count(goods_count);
//		goods.setGoods_onsale(goods_onsale);
//		goods.setGoods_describe(goods_describe);
//		goods.setGoods_store(goods_store);
//		goods.setGoods_type(goods_type);
		
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils          //create GoodsService
	            .getRequiredWebApplicationContext(getServletContext());
		GoodsService gs = (GoodsService) wac.getBean("goodsService");
		
		if(gs.addGoods(goods_name,goods_head,goods_price,goods_count,goods_onsale,goods_describe,goods_store,goods_type,goods_area)){										//addGoods
		
			
			List<Goods> goods=gs.getGoodsByName(goods_name);
			int goods_id=goods.get(0).getGoods_id();
			
			//if addGoods success
			
			request.getRequestDispatcher("GetGoodsByIdServlet?goods_id="+goods_id).forward(request, response);
		}else{															//if addGoods failure
			request.setAttribute("addGoodsStatus", "Add Goods Failure!");
			request.getRequestDispatcher("add_goods.jsp").forward(request, response);
		}
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
