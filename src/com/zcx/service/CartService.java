package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.zcx.bean.CartGoods;
import com.zcx.bean.CartStore;


public class CartService {
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
	 * changeCart
	 */

		public List<CartStore> changeCart(List<CartStore> cart,int cart_user,int goods_id,int cart_goods_count,int goods_store) {
	System.out.println("changeCart start ***************************************");	
	System.out.println(cart_user+"   "+goods_id+"    "+cart_goods_count+"     "+goods_store+"     "+cart);
			
			if(cart!=null){// cart exist
				
	System.out.println("// cart exist");
	System.out.println(cart.size());
					for (int i = 0; i < cart.size(); i++) {// each store
	System.out.println("cart_size="+cart.size());
		
						CartStore cartStore = (CartStore) cart.get(i);
	System.out.println("cart_store_id="+cartStore.getCart_store_id());
						if (cartStore.getCart_store_id() == goods_store) {// store exist
							
	System.out.println("// store exist");
							List<CartGoods> cartGoodsList = cartStore.getCart_goods_list();
		
							for (int j = 0; j < cartGoodsList.size(); j++) {// each  goods
		
								CartGoods cartGoods = cartGoodsList.get(j);
		
								if (cartGoods.getGoods_id() == goods_id) {// goods exist
	System.out.println("// goods exist");
									cartGoods.setCart_goods_count(cart_goods_count);
									break;
								} else {// goods not exist
	System.out.println("// goods not exist");
									if (j==cartGoodsList.size()-1) {//the last goods in the goods list
										CartGoods nCartGoods = new CartGoods();
										nCartGoods.setCart_user(cart_user);
										nCartGoods.setGoods_id(goods_id);
										nCartGoods.setCart_goods_count(cart_goods_count);
	System.out.println("goods_store"+goods_store);
										//nCartGoods.setGoods_store_id(goods_store);
										cartGoodsList.add(nCartGoods);// add new goods to cartGoodsList
										break;
									}else {//not the last goods
	System.out.println("not the last goods");
										continue;
										
									}
									
								}
							}
						} else {// store not exist
	System.out.println("// store not exist");
							if(i==cart.size()-1){//if this is the last store in the cart---last
								
								CartStore nCartStore = new CartStore();// new store
								List<CartGoods> nCartGoodsList = new ArrayList<CartGoods>(); // new cart goods  list
								CartGoods nCartGoods = new CartGoods(); // new goods
								
								nCartGoods.setCart_user(cart_user);
								nCartGoods.setGoods_id(goods_id);
								nCartGoods.setCart_goods_count(cart_goods_count);
								//nCartGoods.setGoods_store_id(goods_store);
								
								nCartGoodsList.add(nCartGoods);// add new goods to  cartGoodsList
								nCartStore.setCart_store_id(goods_store);//set new store id for cartStore
								nCartStore.setCart_goods_list(nCartGoodsList);//add new goods list to cartStore
								cart.add(nCartStore);//add new cartStore to cart
								break;
							}else {//not the last
	System.out.println("//not the last store");
								continue;
							}
							
						}
					}
				}else {// cart==null
	System.out.println("// cart not exist");
					cart = new ArrayList<CartStore>();
					
					CartStore nCartStore = new CartStore();// new store
					List<CartGoods> nCartGoodsList = new ArrayList<CartGoods>(); // new cart goods list
					
					CartGoods nCartGoods = new CartGoods(); // new goods
					
					nCartGoods.setCart_user(cart_user);
					nCartGoods.setGoods_id(goods_id);
					nCartGoods.setCart_goods_count(cart_goods_count);
					//nCartGoods.setGoods_store(goods_store);
					
					nCartGoodsList.add(nCartGoods);// add new goods to cartGoodsList
					
					nCartStore.setCart_store_id(goods_store);//set new store_id
					nCartStore.setCart_goods_list(nCartGoodsList);
					cart.add(nCartStore);
				}
			
	System.out.println("changeCart end ***************************************");	
			return cart;
			}	
	
	
	
	
	/**
	 * updateCart
	 */

	public List<CartStore> updateCart(List<CartStore> cart) {//post the whole cart
System.out.println("updateCart start*****************************************");		
		
		for(int i = 0;i<cart.size();i++){					//get each store of the cart
System.out.println("��cart�е�"+i+"���̵�");
			
			CartStore cartStore = cart.get(i);
			List<CartGoods> cartGoodsList=(List<CartGoods>) cartStore.getCart_goods_list();
					
			for(int j=0;j<cartGoodsList.size();j++){				//get each goods in the store
System.out.println("��cartGoodsList�е�"+j+"����Ʒ");
			CartGoods cartGoods = cartGoodsList.get(j);
				
				int cart_user = cartGoods.getCart_user(); 
				int goods_id = cartGoods.getGoods_id();
				int cart_goods_count = cartGoods.getCart_goods_count();
				
System.out.println("cart_user="+cart_user);
System.out.println("goods_id="+goods_id);
System.out.println("cart_goods_count="+cart_goods_count);
				
System.out.println("��ѯ��ݿ⣬����Ʒ�Ƿ����");				
				String sqlifexist="select * from cart_view where cart_user=? and goods_id=?";//check if the goods user want to put into cart is existed
				List<CartGoods> cartGoods_result = jdbcTemplate.query(sqlifexist, new CartRowMapper(),cart_user,goods_id);
System.out.println(sqlifexist);				
				
				if(cartGoods_result.size()==0){			//if not exist
System.out.println("goods not exist");				
					String sqlnotexist = "insert into Cart_Goods "//insert goods information
							+ "(cart_user,goods_id,cart_goods_count) "
							+ "values(?,?,?)";
System.out.println(sqlnotexist);
					jdbcTemplate.update(sqlnotexist,cart_user,goods_id,cart_goods_count);
				}else{
					String sqlexist="update Cart_Goods set cart_goods_count=? where cart_user=? and goods_id=?";
System.out.println(sqlexist);
System.out.println(cart_user);
System.out.println(goods_id);
System.out.println(cart_goods_count);
					jdbcTemplate.update(sqlexist,cart_goods_count,cart_user,goods_id);
				}
				
			}//in
		
		
		}//out
System.out.println("updateCart end*****************************************");		
		return cart;
	}
	
	

	
	
	
/**
 * getCartByUser
 */
	
	public List<CartStore> getCartByUser(int user_id) {
System.out.println("getCartByUser start*******************************");
		List<CartStore> cart =new ArrayList<CartStore>();//new cart

		String sql_store ="select * from cart_view where cart_user=? group by store_id";
System.out.println(sql_store);
		List<CartGoods> store_id_list=jdbcTemplate.query(sql_store, new CartRowMapper(),user_id);//get each store  of this cart
		
		
		for (int i = 0; i < store_id_list.size(); i++) {//put each store name and id to the cart
			CartStore cartStore = new CartStore();
			
			int store_id = store_id_list.get(i).getStore_id();//set store id	
System.out.println("store_id="+store_id);
			String store_name = store_id_list.get(i).getStore_name();//set store name
System.out.println("store_name="+store_name);
			
			cartStore.setCart_store_id(store_id);			//set cartStore id
			cartStore.setCart_store_name(store_name);//set cartStore name
			
			String  sql="select * from cart_view where cart_user=? and store_id=?";
			List<CartGoods> cart_goods_list=jdbcTemplate.query(sql, new CartRowMapper(),user_id,store_id);
System.out.println(sql);		
			cartStore.setCart_goods_list(cart_goods_list);//set cartGoodsList
			
			
			cart.add(cartStore);
		}
		
		
		
		
		
System.out.println("getCartByUser end*******************************");	
		if(cart.size()==0){
			cart=null;
		}
		return cart;
	}

	
	
/**
 * deleteCartGoods
 */
	
public void deleteCartGoods(int cart_user,int goods_id) {
	String sql = "delete from Cart_goods where cart_user=? and goods_id=?";
	jdbcTemplate.update(sql);
}	
	
/**
 * 
 * cleanCart	
 */
	
public void cleanCart(int cart_user) {
	String sql = "delete from Cart_goods where cart_user=?";
	jdbcTemplate.update(sql,cart_user);
}	
	
	
	
	
	
	
	

	/**
	 * CartRowMapper
	 */
	private class CartRowMapper implements RowMapper<CartGoods> {
		public CartGoods mapRow(ResultSet rs, int rowNum) throws SQLException {

			CartGoods cartGoods = new CartGoods();
			
			cartGoods.setCart_user(rs.getInt("cart_user"));
			cartGoods.setGoods_id(rs.getInt("goods_id"));
			cartGoods.setGoods_head(rs.getString("goods_head"));
			cartGoods.setGoods_name(rs.getString("goods_name"));
			cartGoods.setGoods_price(rs.getDouble("goods_price"));
			cartGoods.setCart_goods_count(rs.getInt("cart_goods_count"));
			cartGoods.setStore_name(rs.getString("store_name"));
			cartGoods.setStore_id(rs.getInt("store_id"));
			
			

			return cartGoods;
		}
	}
	
	
	
	
}
