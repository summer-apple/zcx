package com.zcx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zcx.bean.Article;
import com.zcx.bean.User;
import com.zcx.service.ArticleService;

public class UpdateArticleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateArticleServlet() {
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
		String article_title = request.getParameter("article_title");
		String article_context = request.getParameter("article_context");
		String article_tag = request.getParameter("article_tag");
		String article_type = request.getParameter("article_type");
		
		
		
		
		System.out.println("article_title="+article_title);
		System.out.println("article_tag="+article_tag);
		System.out.println("article_type="+article_type);
		System.out.println("article_context="+article_context+"@@");
		
		
		WebApplicationContext wac = WebApplicationContextUtils         
	            .getRequiredWebApplicationContext(getServletContext());
		ArticleService as = (ArticleService) wac.getBean("articleService");
		
		Article article = (Article) request.getSession().getAttribute("article");
		String article_id = article.getArticle_id();
		
		
		Article article1 = as.updateArticle(article_id, article_title, article_context, article_type, article_tag);
		System.out.println(article.getArticle_time());
		System.out.println(article.getArticle_head());
		
		request.getSession().setAttribute("article", article1);
		request.getRequestDispatcher("GetArticleByIdServlet?article_id="+article_id).forward(request, response);
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
