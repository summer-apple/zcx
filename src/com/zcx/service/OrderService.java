package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.zcx.bean.CartGoods;
import com.zcx.bean.CartStore;
import com.zcx.bean.Goods;
import com.zcx.bean.Order;
import com.zcx.bean.OrderGoods;
import com.zcx.bean.User;

public class OrderService {
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
 * createOrder
 * @param cart
 * @param user
 */
	public void createOrder(List<CartStore> cart,User user) {
		
		int order_user = user.getUser_id();
		int order_address = user.getUser_address();
		String order_state = "待确认";

		
		for (int i = 0; i < cart.size(); i++) {//each store
			CartStore cartStore =  cart.get(i);
			int order_store = cartStore.getCart_store_id();
	
			
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
 		
			String order_time = sdf1.format(date);
			String order_id = sdf2.format(date)+"-"+order_store+"-"+order_user;
			String sqlorder = "insert into Orders(order_id,order_time,order_user,order_store,order_address,order_state) values(?,?,?,?,?,?)";
			jdbcTemplate.update(sqlorder,order_id,order_time,order_user,order_store,order_address,order_state);
			

			
			List<CartGoods> cart_goods_list = cartStore.getCart_goods_list();
			
			double order_amount = 0.00;
			
			for (int j = 0; j < cart_goods_list.size(); j++) {
				CartGoods  cartGoods=cart_goods_list.get(j);
				int goods_id=cartGoods.getGoods_id();
				int order_goods_count = cartGoods.getCart_goods_count();
				double goods_price = cartGoods.getGoods_price();
				order_amount+=goods_price*order_goods_count;
				
				
				String sqlcountchange = "update goods set goods_count=goods_count-? where goods_id=?";
				jdbcTemplate.update(sqlcountchange,order_goods_count,goods_id);

				String sqlorder_goods = "insert into Order_goods(order_id,goods_id,order_goods_count) values(?,?,?)";
				jdbcTemplate.update(sqlorder_goods,order_id,goods_id,order_goods_count);
			}
			
			
			
			
			//set order amount		
			
			String sqlamount = "update  Orders set order_amount=? where order_id=?";
			jdbcTemplate.update(sqlamount,order_amount,order_id);
			
		}
			
		
	}
	

	
/**
 * confirmOrder
 */
	
	public Order confirmOrder(String order_id) {
		String sql = "update Orders set order_state='已确认' where order_id=?";
		jdbcTemplate.update(sql,order_id);
		Order order = this.getOrderById(order_id);
		return order;
	}
	
	
/**
 * payOrder
 */
		
	public Order payOrder(String order_id) {
		String sql = "update Orders set order_state='已付款' where order_id=?";
		jdbcTemplate.update(sql,order_id);
		
		Order order = this.getOrderById(order_id);
		
		double order_amount = order.getOrder_amount();
		int user_id = order.getOrder_user_id();
		
		String sqlpay = "update User set user_account=user_account-? where user_id=?";
		jdbcTemplate.update(sqlpay,order_amount,user_id);
		
		String sqlzcx = "insert into Zhongcai(order_id,account) values(?,?)";
		jdbcTemplate.update(sqlzcx,order_id,order_amount);
		
		
	
		
		return order;
	}
		
		
/**
 * outOrder
 */
			
	public Order outOrder(String order_id) {
		String sql = "update Orders set order_state='已发货' where order_id=?";
		jdbcTemplate.update(sql,order_id);
		Order order = this.getOrderById(order_id);
		return order;
	}
	
	
/**
* acceptOrder
*/
		
public Order acceptOrder(String order_id) {
	String sql = "update Orders set order_state='已收货' where order_id=?";
	jdbcTemplate.update(sql,order_id);
	Order order = this.getOrderById(order_id);
	int store_id = order.getOrder_store_id();
	double order_amount = order.getOrder_amount();
	
	String sqlzcx="update Zhongcai set account=0 where order_id=?";
	jdbcTemplate.update(sqlzcx,order_id);
	
	String sqlaccept="update Store set store_account=store_account+? where store_id=?";
	jdbcTemplate.update(sqlaccept,order_amount,store_id);
	
	
	
	return order;
}	
	
	
	
/**
 * getOrderByUser	
 */
	
	
public List<Order> getOrderByUser(int order_user) {



		String sqlorder = "select * from order_view where order_user_id=? order by order_time desc";
		
		List<Order> order_list = (List<Order>) jdbcTemplate.query(sqlorder, new OrderRowMapper(),order_user);	
		
		
		String sqlordergoods = "select * from order_goods_view where order_id=?";	
		
		for (int i = 0; i < order_list.size(); i++) {
			List<OrderGoods> order_goods_list = jdbcTemplate.query(sqlordergoods,new OrderGoodsRowMapper(),order_list.get(i).getOrder_id());
			
			order_list.get(i).setOrder_goods_list(order_goods_list);
		}
	
	return order_list;
}	
	
	






/**
 * getOrderByStore	
 */
	
	
public List<Order> getOrderByStore(int order_store) {


		String sqlorder = "select * from order_view where order_store_id=? order by order_time desc";
		
		List<Order> order_list = (List<Order>) jdbcTemplate.query(sqlorder, new OrderRowMapper(),order_store);	
		
		
		String sqlordergoods = "select * from order_goods_view where order_id=?";	
		
		for (int i = 0; i < order_list.size(); i++) {
			List<OrderGoods> order_goods_list = jdbcTemplate.query(sqlordergoods,new OrderGoodsRowMapper(),order_list.get(i).getOrder_id());
			
			order_list.get(i).setOrder_goods_list(order_goods_list);
		}
	

	return order_list;
}	
	
	
	
/**
 * getOrderById	
 */
	
	public Order getOrderById(String order_id) {
			
		String sql="select * from order_view where order_id=?";
		
		Order order  = (Order) jdbcTemplate.queryForObject(sql,new OrderRowMapper(), order_id);
		
		return order;
	}
	
	
	
	
	
	/**
	 * OrderStoreRowMapper
	 */
	private class OrderStoreRowMapper implements RowMapper<Integer> {
		public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {

			int order_store=rs.getInt("order_store");
			return order_store;
		}
	}	
	
	
	/**
	 * OrderRowMapper
	 */
	private class OrderRowMapper implements RowMapper<Order> {
		public Order mapRow(ResultSet rs, int rowNum) throws SQLException {

			Order order = new Order();
			order.setOrder_id(rs.getString("order_id"));
			order.setOrder_user_id(rs.getInt("order_user_id"));
			order.setOrder_user_name(rs.getString("order_user_name"));
			order.setOrder_store_id(rs.getInt("order_store_id"));
			order.setOrder_store_name(rs.getString("order_store_name"));
			order.setOrder_state(rs.getString("order_state"));
			order.setOrder_time(rs.getDate("order_time").toString());
			order.setOrder_address_id(rs.getInt("order_address_id"));
			order.setOrder_address_context(rs.getString("address_province")+rs.getString("address_city")+rs.getString("address_district")+rs.getString("address_detial"));
			order.setOrder_amount(rs.getDouble("order_amount"));				
			return order;
		}
	}	
	
	
	
	/**
	 * 
	 */
	private class OrderGoodsRowMapper implements RowMapper<OrderGoods> {
		public OrderGoods mapRow(ResultSet rs, int rowNum) throws SQLException {

			OrderGoods orderGoods = new OrderGoods();
			orderGoods.setGoods_id(rs.getInt("goods_id"));
			orderGoods.setGoods_name(rs.getString("goods_name"));
			orderGoods.setGoods_price(rs.getDouble("goods_price"));
			orderGoods.setOrder_goods_count(rs.getInt("order_goods_count"));
			orderGoods.setGoods_head(rs.getString("goods_head"));
			
			return orderGoods;
		}
	}	

	
	
}
