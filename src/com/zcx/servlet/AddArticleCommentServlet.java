package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.User;
import com.zcx.service.ArticleService;

public class AddArticleCommentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddArticleCommentServlet() {
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

System.out.println("add comment start");
		request.setCharacterEncoding("utf-8");
		String article_id = request.getParameter("article_id");
		User user = (User) request.getSession().getAttribute("user");
		int comment_user=user.getUser_id();
		String comment_context = request.getParameter("comment_context");
	
		
		WebApplicationContext wac = WebApplicationContextUtils         
	            .getRequiredWebApplicationContext(getServletContext());
		ArticleService as = (ArticleService) wac.getBean("articleService");
		
		as.addArticleComment(article_id, comment_user, comment_context);
		
		//request.getRequestDispatcher("GetArticleByIdServlet?article="+article_id).forward(request, response	);
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
