package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zcx.bean.Address;
import com.zcx.bean.Article;
import com.zcx.bean.ArticleComment;
import com.zcx.bean.OrderGoods;

public class ArticleService {

	private JdbcTemplate jdbcTemplate; // new jdbcTemplate

	/**
	 * get and set jdbcTemplate
	 */
	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
/**
 * releaseArticle	
 */
	
	public Article releaseArticle(int article_user,String article_title,String article_context,String article_type,String article_tag,String article_head) {
		
		Date date = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String article_time = sdf1.format(date);
		
		String article_id = sdf2.format(date)+article_user;
		
		String sql = "insert into Article(article_id,article_user,article_time,article_title,article_context,article_type,article_tag,article_head) values(?,?,?,?,?,?,?,?)";
		
		jdbcTemplate.update(sql,article_id,article_user,article_time,article_title,article_context,article_type,article_tag,article_head);
		
		Article article = this.getArticleById(article_id);
		
		
		return article;
	}
	
	
	/**
	 * updateArticle	
	 */
		
		public Article updateArticle(String article_id,String article_title,String article_context,String article_type,String article_tag) {
			
			
			String sql = "update Article set article_title=?,article_context=?,article_type=?,article_tag=? where article_id=?";
			
			jdbcTemplate.update(sql,article_title,article_context,article_type,article_tag,article_id);
			
			Article article = this.getArticleById(article_id);
			
			
			return article;
		}	
	
	
	/**
	* getArticleByUser	
	*/
	
	
	public List<Article> getArticleByUser(int article_user) {
		String sql = "select * from article_view where article_user_id=? order by article_time desc";
		List<Article> articlelist = jdbcTemplate.query(sql, new ArticleRowMapper(),article_user);
		return this.getShortContext(articlelist);
	}
	
	
	
	
	/**
	* getArticleList	
	*/
	
	
	public List<Article> getArticleList() {
		String sql = "select * from article_view";
		List<Article> articlelist = jdbcTemplate.query(sql, new ArticleRowMapper());
		return this.getShortContext(articlelist);
	}
	
	
	
	/**
	* getArticleByType	
	*/
	
	
	public List<Article> getArticleByType(String  article_type) {
		String sql = "select * from article_view where article_type=?";
		List<Article> articlelist = jdbcTemplate.query(sql, new ArticleRowMapper(),article_type);
		return this.getShortContext(articlelist);
	}
	
	
	/**
	 * getArticleById	
	 */
		
		
		public Article getArticleById(String article_id) {
			String sql = "select * from article_view where article_id=?";
			Article article = jdbcTemplate.queryForObject(sql, new ArticleRowMapper(),article_id);
			article.setArticle_comment_list(this.getArticleComment(article_id));
			return article;
		}	
	
	
	
	
	/**
	 * deleteArticle
	 */
	

	public void deleteArticle(String article_id) {
		String sql = "delete * from article_view where article_id=?";
		jdbcTemplate.update(sql);
	}
	
	
	/**
	 * getRandomArticle
	 */
	
	public List<Article> getRandomArticle() {
		String sql = "select * from article_view order by rand() limit 5";
		List<Article> articlelist = jdbcTemplate.query(sql, new ArticleRowMapper());
		
		return this.getShortContext(articlelist);
			
	}
	
	
	
	
	/*
	 * searchArticle
	 */
	public List<Article> searchArticle(String key_word){
		key_word ="%"+key_word+"%";
		
		String sql = "select * from article_view where article_title like ? or article_context like ?";
		
		List<Article> articlelist = jdbcTemplate.query(sql, new ArticleRowMapper(),key_word,key_word);
		
		articlelist = this.getShortContext(articlelist);
		
		return articlelist;
	}
	
	
	
	private List<Article> getShortContext(List<Article> articlelist) {
	
		System.out.println("getShortContext.....");
		
		for(int i=0;i<articlelist.size();i++){
			
			String fullcontext = articlelist.get(i).getArticle_context();
			String shortcontext="";
			
			 if (fullcontext.length()>350) {
	
				 shortcontext=fullcontext.substring(125, 475);
				 shortcontext=shortcontext+"...";
				 
				 articlelist.get(i).setArticle_context(shortcontext);
	
				 }
		}
		
		return articlelist;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * addArticleComment
	 */
	
	public void addArticleComment(String aricle_id,int comment_user,String comment_context) {
		
System.out.println("Add comment method");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String comment_time = sdf.format(date);
		
		String sql = "insert into Article_comment(article_id,comment_user,comment_time,comment_context) values(?,?,?,?)";
		jdbcTemplate.update(sql,aricle_id,comment_user,comment_time,comment_context);
		
		
	}
	
	
	/*
	 * getArticleComment
	 */
	
	
	private List<ArticleComment> getArticleComment(String article_id) {
		String sql = "select * from article_comment_view where article_id=?";
		List<ArticleComment> articlecommentslist = jdbcTemplate.query(sql,new ArticleCommentRowMapper(), article_id);
		return articlecommentslist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * ArticleRowMapper
	 */
	private class ArticleRowMapper implements RowMapper<Article> {
		public Article mapRow(ResultSet rs, int rowNum) throws SQLException {

			Article article = new Article();
			article.setArticle_id(rs.getString("article_id"));
			article.setArticle_title(rs.getString("article_title"));
			article.setArticle_time(rs.getDate("article_time").toString());
			article.setArticle_user_id(rs.getInt("article_user_id"));
			article.setArticle_user_name(rs.getString("article_user_name"));
			article.setArticle_head(rs.getString("article_head"));
			article.setArticle_context(rs.getString("article_context"));
			article.setArticle_type(rs.getString("article_type"));
			article.setArticle_tag(rs.getString("article_tag"));
			
			return article;
		}
	}	
	
	
	
	
	
	/**
	 * ArticleCommentRowMapper
	 */
	private class ArticleCommentRowMapper implements RowMapper<ArticleComment> {
		public ArticleComment mapRow(ResultSet rs, int rowNum) throws SQLException {

			ArticleComment articleComment = new ArticleComment();
			articleComment.setArticle_id(rs.getString("article_id"));
			articleComment.setAtricle_title(rs.getString("article_title"));
			articleComment.setComment_user_id(rs.getInt("comment_user_id"));
			articleComment.setComment_user_name(rs.getString("comment_user_name"));
			articleComment.setComment_user_head(rs.getString("comment_user_head"));
			articleComment.setComment_time(rs.getDate("comment_time").toString());
			articleComment.setComment_context(rs.getString("comment_context"));
			
			return articleComment;
		}
	}	
	
	
	
	
	
	
	
	
	
	
}
