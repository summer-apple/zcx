package com.zcx.bean;
import java.util.Date;

public class Ware_order {
	
	private String ware_order_id;
	
	private Date ware_order_time;
	
	private int ware_id;
	
	private int area_id;
	
	private int ware_order_count;
	
	private int store_id;

	public String getWare_order_id() {
		return ware_order_id;
	}

	public void setWare_order_id(String ware_order_id) {
		this.ware_order_id = ware_order_id;
	}

	public Date getWare_order_time() {
		return ware_order_time;
	}

	public void setWare_order_time(Date ware_order_time) {
		this.ware_order_time = ware_order_time;
	}

	public int getWare_id() {
		return ware_id;
	}

	public void setWare_id(int ware_id) {
		this.ware_id = ware_id;
	}

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

	public int getWare_order_count() {
		return ware_order_count;
	}

	public void setWare_order_count(int ware_order_count) {
		this.ware_order_count = ware_order_count;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

}
