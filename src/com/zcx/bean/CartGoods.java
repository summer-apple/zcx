package com.zcx.bean;

public class CartGoods {
	private int cart_user;
	private int goods_id;
	private String goods_name;
	private String goods_head;
	private double goods_price;
	private int cart_goods_count;
	private int store_id;
	private String store_name;

	public int getCart_user() {
		return cart_user;
	}
	public void setCart_user(int cart_user) {
		this.cart_user = cart_user;
	}
	
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getCart_goods_count() {
		return cart_goods_count;
	}
	public void setCart_goods_count(int cart_goods_count) {
		this.cart_goods_count = cart_goods_count;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_head() {
		return goods_head;
	}
	public void setGoods_head(String goods_head) {
		this.goods_head = goods_head;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	 
	
	
	
	
}
