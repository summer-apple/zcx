package com.zcx.bean;

import java.util.Date;
import java.util.List;

public class Order {
	private String order_id;
	private String order_time;
	private int order_user_id;
	private String order_user_name;
	private int order_store_id;
	private String order_store_name;
	private int order_address_id;
	private String order_address_context;
	private double order_carriage;
	private String order_state;
	private List<OrderGoods> order_goods_list;
	private double order_amount;
	
	
	
	public double getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(double order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public int getOrder_user_id() {
		return order_user_id;
	}
	public void setOrder_user_id(int order_user_id) {
		this.order_user_id = order_user_id;
	}
	public String getOrder_user_name() {
		return order_user_name;
	}
	public void setOrder_user_name(String order_user_name) {
		this.order_user_name = order_user_name;
	}
	public int getOrder_store_id() {
		return order_store_id;
	}
	public void setOrder_store_id(int order_store_id) {
		this.order_store_id = order_store_id;
	}
	public String getOrder_store_name() {
		return order_store_name;
	}
	public void setOrder_store_name(String order_store_name) {
		this.order_store_name = order_store_name;
	}
	public int getOrder_address_id() {
		return order_address_id;
	}
	public void setOrder_address_id(int order_address_id) {
		this.order_address_id = order_address_id;
	}
	public String getOrder_address_context() {
		return order_address_context;
	}
	public void setOrder_address_context(String order_address_context) {
		this.order_address_context = order_address_context;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public List<OrderGoods> getOrder_goods_list() {
		return order_goods_list;
	}
	public void setOrder_goods_list(List<OrderGoods> order_goods_list) {
		this.order_goods_list = order_goods_list;
	}
	public double getOrder_carriage() {
		return order_carriage;
	}
	public void setOrder_carriage(double order_carriage) {
		this.order_carriage = order_carriage;
	}
	
	
	
}
