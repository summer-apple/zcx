package com.zcx.bean;

import java.util.List;

public class Article {
	private String article_id;
	private int article_user_id;
	private String article_user_name;
	private String article_head;
	private String article_title;
	private String article_time;
	private String article_context;
	private String article_tag;
	private String article_type;
	private List<ArticleComment> article_comment_list;
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public int getArticle_user_id() {
		return article_user_id;
	}
	public void setArticle_user_id(int article_user_id) {
		this.article_user_id = article_user_id;
	}
	public String getArticle_user_name() {
		return article_user_name;
	}
	public void setArticle_user_name(String article_user_name) {
		this.article_user_name = article_user_name;
	}
	public String getArticle_head() {
		return article_head;
	}
	public void setArticle_head(String article_head) {
		this.article_head = article_head;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_time() {
		return article_time;
	}
	public void setArticle_time(String article_time) {
		this.article_time = article_time;
	}
	public String getArticle_context() {
		return article_context;
	}
	public void setArticle_context(String article_context) {
		this.article_context = article_context;
	}
	public String getArticle_tag() {
		return article_tag;
	}
	public void setArticle_tag(String article_tag) {
		this.article_tag = article_tag;
	}
	public String getArticle_type() {
		return article_type;
	}
	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}
	public List<ArticleComment> getArticle_comment_list() {
		return article_comment_list;
	}
	public void setArticle_comment_list(List<ArticleComment> article_comment_list) {
		this.article_comment_list = article_comment_list;
	}
	
	
	
	
	
	
	
	
	
}
