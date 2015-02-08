package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zcx.bean.Store;




public class StoreService {
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
	 * checkStoreName
	 * 
	 * @param un
	 * @return
	 */
	public boolean checkStoreName(String sn) {
		boolean checkUnFlag;
		String sql = "select * from Store " + "where store_name=?";
		List<Store> storeList = jdbcTemplate
				.query(sql, new StoreRowMapper(), sn);
		if (storeList.size() > 0) {
			checkUnFlag = true;// store_name is exist
		} else {
			checkUnFlag = false;// store_name is not exist
		}
		return checkUnFlag;
	}

	
	
	
/**
* addStore
*/
	
	public boolean addStore(String sn,int uid) {
		boolean addStoreFlag;
		String sql="insert into Store " +
					"(store_name,store_owner) " +
					"values(?,?)";
		jdbcTemplate.update(sql,sn,uid);
		
		
		String sqlflag="select * from Store where store_name=?";
		List<Store> storeList = jdbcTemplate.query(sqlflag, new StoreRowMapper(),sn);
		if (storeList.size()>0) {
			
			int store_id=storeList.get(0).getStore_id();//update the User.user_store
			String sqluser="update User set user_store=? where user_id=?";
			jdbcTemplate.update(sqluser,store_id,uid);
			
			
			addStoreFlag=true;//add store success
		} else {
			addStoreFlag=false;//add store failure
		}
		return addStoreFlag;
		
		
	}
	
/**
* deleteStore		
*/
	public void deleteStore(String sn) {
		String sql="delete from Store " +
				"where store_name=?";
		jdbcTemplate.update(sql,sn);
	}
	

	
/**
 * getStoreList
 */
		
	public List<Store> getStoreList() {
		String sql="select * from Store";
		List<Store> storelist = jdbcTemplate.query(sql, new StoreRowMapper());
		return storelist;
	}	
	
	

	
/**
 * getStoreByOwner	
 */
	
	public  Store getStoreByOwner(int owner) {
		String sql="select * from Store where store_owner=?";
		Store store = jdbcTemplate.queryForObject(sql, new StoreRowMapper(),owner);
		return store;
	}
	

	
/**
* getStoreById	
*/
		
	public  Store getStoreById(int store_id) {
		String sql="select * from Store where store_id=?";
		Store store = jdbcTemplate.queryForObject(sql, new StoreRowMapper(),store_id);
		return store;
	}
		
	
	
	
	
	
	
	
	
	
	
	/**
	 * StoreRowMapper
	 */
	private class StoreRowMapper implements RowMapper<Store> {
		public Store mapRow(ResultSet rs, int rowNum) throws SQLException {
			Store store = new Store();
			store.setStore_id(rs.getInt("store_id"));
			store.setStore_name(rs.getString("store_name"));
			store.setStore_owner(rs.getInt("store_owner"));
			return store;
		}
	}

}
