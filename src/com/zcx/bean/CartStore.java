package com.zcx.bean;

import java.io.Serializable;
import java.util.List;
import com.zcx.bean.CartGoods;

public class CartStore implements Serializable{
	private int cart_store_id;
	private String cart_store_name;
	private List<CartGoods> cart_goods_list;
	public int getCart_store_id() {
		return cart_store_id;
	}
	public void setCart_store_id(int cart_store_id) {
		this.cart_store_id = cart_store_id;
	}
	public String getCart_store_name() {
		return cart_store_name;
	}
	public void setCart_store_name(String cart_store_name) {
		this.cart_store_name = cart_store_name;
	}
	public List<CartGoods> getCart_goods_list() {
		return cart_goods_list;
	}
	public void setCart_goods_list(List<CartGoods> cart_goods_list) {
		this.cart_goods_list = cart_goods_list;
	}
	
	
}
