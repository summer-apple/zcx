package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.zcx.bean.Goods;
import com.zcx.bean.GoodsType;

public class GoodsService {
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
	 * addGoods
	 */

	public boolean addGoods(String goods_name,String goods_head, double goods_price,
			int goods_count, String goods_onsale, String goods_describe,
			int goods_store,int goods_type,int goods_area) {
		boolean addGoodsFlag;
		
		
		String sql = "insert into Goods "//insert goods information
				+ "(goods_name,goods_head,goods_price,goods_count,goods_onsale,goods_describe,goods_store,goods_type,goods_area) "
				+ "values(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, goods_name, goods_head,goods_price, goods_count,
				goods_onsale, goods_describe, goods_store,goods_type,goods_area);

		String sqlflag = "select * from goods_view where goods_name=?";
		List<Goods> goodsList = jdbcTemplate.query(sqlflag,
				new GoodsRowMapper(), goods_name);
		if (goodsList.size() > 0) {
			addGoodsFlag = true;// add goods success
		} else {
			addGoodsFlag = false;// add goods failure
		}
		return addGoodsFlag;

	}

	
	
	/*
	 * updateGoods
	 */
	
	
	public Goods updateGoods(int goods_id,String goods_name,String goods_head,double goods_price,int goods_count,String goods_onsale,String goods_describe,int goods_type,int goods_area) {
		String sql = "update Goods set goods_name=?,goods_head=?,goods_price=?,goods_count=?,goods_onsale=?,goods_describe=?,goods_type=?,goods_area=? where goods_id=?";
		jdbcTemplate.update(sql, goods_name, goods_head, goods_price, goods_count, goods_onsale, goods_describe, goods_type, goods_area,goods_id);
		Goods goods = this.getGoodsById(goods_id);
		return goods;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * deleteGoods
	 */
	public void deleteGoods(int goods_id) {
		String sql = "delete from Goods where goods_id=?";
		jdbcTemplate.update(sql, goods_id);
	}

	/**
	 * getGoodsList
	 * 
	 * @return
	 */

	public List<Goods> getGoodsList() {
		String sql = "select * from goods_view where goods_onsale='onsale'";
		List<Goods> goodslist = jdbcTemplate.query(sql, new GoodsRowMapper());
		return goodslist;
	}

	/**
	 * getGoodsByStore
	 * 
	 * @return
	 */

	public List<Goods> getGoodsByStore(int goods_store) {
		String sql = "select * from goods_view where goods_store=? order by goods_id desc";
		List<Goods> goodslist = jdbcTemplate.query(sql, new GoodsRowMapper(),
				goods_store);
		return goodslist;
	}

	/**
	 * getGoodsById
	 * 
	 * @return
	 */

	public Goods getGoodsById(int goods_id) {
		String sql = "select * from goods_view where goods_id=?";
		Goods goods = jdbcTemplate.queryForObject(sql, new GoodsRowMapper(),
				goods_id);
		return goods;
	}

	
	
	/**
	 * search
	 * 
	 * @return
	 */

	public List<Goods> search(String search_key) {
		search_key = "%"+search_key+"%";
		System.out.println(search_key);
		String sql = "select * from goods_view where goods_name like ?";
		List<Goods> goodslist = jdbcTemplate.query(sql, new GoodsRowMapper(),
				search_key);
		return goodslist;
	}
	
	/**
	 * getGoodsByName
	 * 
	 * @return
	 */

	public List<Goods> getGoodsByName(String goods_name) {
		String sql = "select * from goods_view where goods_name=?";
		List<Goods> goods = jdbcTemplate.query(sql, new GoodsRowMapper(),
				goods_name);
		return goods;
	}
	
	/**
	 * getGoodsByPrice
	 * 
	 * @return
	 */

	public List<Goods> getGoodsByPrice(double low,double high) {
		String sql = "select * from goods_view where goods_store=?";//???????
		List<Goods> goodslist = jdbcTemplate.query(sql, new GoodsRowMapper(),
				low,high);
		return goodslist;
	}
	
	
	
	
	
	
	
	public String uploadImage(String address) {
		
		String sql="insert into";
		
		
		return address;
		
	}
	
	
	
	public List<GoodsType> getGoodsType() {
		String sql ="select * from Goods_type";
		List<GoodsType> typelist =jdbcTemplate.query(sql, new TypeRowMapper());
		return typelist;
	}
	
	
	
	
	
	
	
	
	
	/**
	 * GoodsRowMapper
	 */
	private class GoodsRowMapper implements RowMapper<Goods> {
		public Goods mapRow(ResultSet rs, int rowNum) throws SQLException {

			Goods goods = new Goods();
			goods.setGoods_id(rs.getInt("goods_id"));
			goods.setGoods_name(rs.getString("goods_name"));
			goods.setGoods_price(rs.getDouble("goods_price"));
			goods.setGoods_count(rs.getInt("goods_count"));
			goods.setGoods_onsale(rs.getString("goods_onsale"));
			goods.setGoods_sale_count(rs.getInt("goods_sale_count"));
			goods.setGoods_describe(rs.getString("goods_describe"));
			goods.setGoods_store(rs.getInt("goods_store"));
			goods.setGoods_area(rs.getInt("goods_area"));
			goods.setGoods_area(rs.getInt("goods_ware"));
			goods.setGoods_head(rs.getString("goods_head"));
			

			return goods;
		}
	}
	
	/**
	 * TypeRowMapper
	 */
	private class TypeRowMapper implements RowMapper<GoodsType> {
		public GoodsType mapRow(ResultSet rs, int rowNum) throws SQLException {

			GoodsType type = new GoodsType();
			
			type.setGoods_type_id(rs.getInt("goods_type_id"));
			type.setGoods_type_name(rs.getString("goods_type_name"));

			return type;
		}
	}
	
	

}
