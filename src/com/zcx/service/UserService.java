package com.zcx.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.SerializationException;
import org.apache.log4j.net.SyslogAppender;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zcx.bean.Address;
import com.zcx.bean.User;

public class UserService {
	
		private JdbcTemplate jdbcTemplate;  //new jdbcTemplate
		
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
 * checkUserName	
 * @param un
 * @return
 */
		public boolean checkUserName(String un) {
			boolean checkUnFlag;
			String sql="select * from User " +
					"where user_name=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),un);
			if (userList.size()>0) {
				checkUnFlag=true;//user_name is exist
			} else {
				checkUnFlag=false;//user_name is not exist
			}
			return checkUnFlag;
		}
		
		
		
/**
 * checkUserEmail		
 */
		
		public boolean checkUserEmail(String ue) {
			boolean checkUeFlag;
			String sql="select * from User " +
					"where user_email=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),ue);
			if (userList.size()>0) {
				checkUeFlag=true;//user_name is exist
			} else {
				checkUeFlag=false;//user_name is not exist
			}
			return checkUeFlag;
		}
		
/**
 * checkUser		
 */
		public User checkUser(String un,String up) {
			User user=new User();
			String sql="select * from User where user_name=? and user_pass=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),un,up);
			if (userList.size()!=0) {
				user=userList.get(0);
				return user;
				
			} else {
				user=null;
				return user;
			}
			
		}
		
/**
 * addUser
 */
		
		public boolean addUser(String un,String up,String ue) {
			boolean addUserFlag;
			String sql="insert into User " +
					"(user_name,user_pass,user_email) " +
					"values(?,?,?)";
			jdbcTemplate.update(sql,un,up,ue);
			
			
			String sqlflag="select * from User " +
					"where user_name=?";
			List<User> userList = jdbcTemplate.query(sqlflag, new UserRowMapper(),un);
			if (userList.size()>0) {
				addUserFlag=true;//add user success
			} else {
				addUserFlag=false;//add user failure
			}
			return addUserFlag;
			
			
		}
		
		
/**
 * updateUserInfo		
 */
		
		public User updateUserInfo(User user,String user_true_name,String user_head,String user_sex,String user_phone,String user_id_card_no,String user_birth,String address_province,String address_city,String address_district,String address_detial) {
			
						
			int user_id = user.getUser_id();
			int user_address = user.getUser_address();
			
			if (user_address==0) {
//System.out.println("address not exist");
				String sqladdress = "insert into Address(address_user_id,address_name,address_phone,address_province,address_city,address_district,address_detial) values(?,?,?,?,?,?,?)";
//System.out.println(sqladdress);
//System.out.println("user_id="+user_id);
				jdbcTemplate.update(sqladdress,user_id,user_true_name,user_phone,address_province,address_city,address_district,address_detial);
				
				
//				User user2 = this.getUserById(user_id);//after update user
//				user_address = user2.getUser_address();
				int new_address = this.getAddressByUser(user.getUser_id()).get(0).getAddress_id();
//System.out.println("new address id = "+new_address);
				
				String sqluser="update User set user_true_name=?,user_head=?,user_sex=?,user_phone=?,user_id_card_no=?,user_birth=?,user_address=? where user_id=?";
				
				jdbcTemplate.update(sqluser,user_true_name,user_head,user_sex,user_phone,user_id_card_no,user_birth,new_address,user_id);

			}else {
//System.out.println("address exist");
				String sqladdress = "update Address set address_name=?,address_phone=?,address_province=?,address_city=?,address_district=?,address_detial=? where address_id=?";
//System.out.println(sqladdress);
//System.out.println("user_true_name"+user_true_name);
//System.out.println("user_phone"+user_phone);
//System.out.println("address_province"+address_province);
//System.out.println("address_city"+address_city);
//System.out.println("address_district"+address_district);
//System.out.println("address_detial"+address_detial);
//System.out.println("user_address="+user_address);
				jdbcTemplate.update(sqladdress,user_true_name,user_phone,address_province,address_city,address_district,address_detial,user_address);
				
				
				
				
				
				String sqluser="update User set user_true_name=?,user_head=?,user_sex=?,user_phone=?,user_id_card_no=?,user_birth=? where user_id=?";
System.out.println(sqluser);

System.out.println("user_id="+user_id);

System.out.println("user_true_name="+user_true_name);
	
System.out.println("user_sex="+user_sex);

System.out.println("user_phone="+user_phone);
	
System.out.println("user_id_card_no="+user_id_card_no);

System.out.println("user_birth="+user_birth);		
				jdbcTemplate.update(sqluser,user_true_name,user_head,user_sex,user_phone,user_id_card_no,user_birth,user_id);
				
			}
			
			
			User user3 = this.getUserById(user_id);
			return user3;
		}

		
/**
 * deleteUser		
 */
		public void deleteUser(String un) {
			String sql="delete from User " +
					"where user_name=?";
			jdbcTemplate.update(sql,un);
		}

/**
 * getUserList
 * @return
 */
	
		public List<User> getUserList(int self_id) {
			String sql="select * from User";
			List<User> userlist = jdbcTemplate.query(sql, new UserRowMapper());
			
			userlist =this.getFollow(userlist, self_id);//get follow
			
			return userlist;
		}		
		
		
		
		
/**
 * getUserById		
 */
		
		public User getUserById(int user_id) {
			String sql="select * from User where user_id=?";
			User user = jdbcTemplate.queryForObject(sql, new UserRowMapper(),user_id);
			return user;
		}		
		
/**
 * getUserByFollow		
 */
		public List<User> getUserByFollow(int self_id) {
			
			List<User> userlist =new ArrayList<User>(); 
			
			List<Integer> followlist = jdbcTemplate.query("select follow_id from follow where self_id=?",new FollowRowMapper(), self_id);
			
			for (int i = 0; i < followlist.size(); i++) {
				int user_id=followlist.get(i);
				String sql="select * from User where user_id=?";
				User user = jdbcTemplate.queryForObject(sql, new UserRowMapper(),user_id);
				
				userlist.add(user);
				
			}
			
			userlist =this.getFollow(userlist, self_id);//get follow
			
			return userlist;
		}	
		
		
		
		
/**
 * getAddressById	
 */

		public List<Address> getAddressById(int address_id) {
			String sql="select * from Address where address_id=?";
			List<Address> addresslist = jdbcTemplate.query(sql, new AddressRowMapper(),address_id);
			return addresslist;
		}	
		
		/**
		 * getAddressByUser		
		 */

				public List<Address> getAddressByUser(int address_user_id) {
					String sql="select * from Address where address_user_id=?";
					List<Address> addresslist = jdbcTemplate.query(sql, new AddressRowMapper(),address_user_id);
					return addresslist;
				}		
		
		
		
/**
 * follow		
 */
		
		public void follow(int follow_id,int self_id) {
			String sql = "insert into follow(self_id,follow_id) values(?,?)";
			jdbcTemplate.update(sql,self_id,follow_id);
		}
		
/**
 * disFollow		
 */
				
		public void disFollow(int follow_id,int self_id) {
			String sql = "delete from follow where self_id=? and follow_id=?";
			jdbcTemplate.update(sql,self_id,follow_id);
		}		
		
/**
 * getFollow		
 */
		
		private List<User> getFollow(List<User> userlist,int self_id) {
			String sql = "select * from Follow where self_id=?";
			 
			List<Integer> followlist = jdbcTemplate.query(sql,new FollowRowMapper(),self_id); 
			
			
			for (int i = 0; i < userlist.size(); i++) {
				String is_follow ="no";
				
				for (int j = 0; j < followlist.size(); j++) {
					int follow_id = followlist.get(j);
					if (follow_id==userlist.get(i).getUser_id()) {
						is_follow="yes";
						break;
					}
				}//in for
				
				userlist.get(i).setIs_follow(is_follow);
				 
			}//out for
			
			
			return userlist;
		}
		

		
/**
 * getFollowMe
 */
		
		
		
		
		
/**
 * UserRowMapper
 */
		private class UserRowMapper implements RowMapper<User>  {
			public User mapRow(ResultSet rs,int rowNum) throws SQLException{
				
				User user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_head(rs.getString("user_head"));
				user.setUser_store(rs.getInt("user_store"));
				user.setUser_address(rs.getInt("user_address"));
				user.setUser_account(rs.getDouble("user_account"));
				user.setUser_birth(rs.getDate("user_birth").toString());
				user.setUser_id_card_no(rs.getString("user_id_card_no"));
				user.setUser_true_name(rs.getString("user_true_name"));
				user.setUser_phone(rs.getString("user_phone"));
				user.setUser_sex(rs.getString("user_sex"));
				user.setUser_type(rs.getString("user_type"));
		
				return user;
			}
		}
		
		
		
		
		/**
		 * AddressRowMapper
		 */
				private class AddressRowMapper implements RowMapper<Address>  {
					public Address mapRow(ResultSet rs,int rowNum) throws SQLException{
						
						Address address = new Address();
						address.setAddress_id(rs.getInt("address_id"));
System.out.println(rs.getInt("address_id"));
						address.setAddress_user_id(rs.getInt("address_user_id"));
						address.setAddress_name(rs.getString("address_name"));
						address.setAddress_phone(rs.getString("address_phone"));
						address.setAddress_province(rs.getString("address_province"));
						address.setAddress_city(rs.getString("address_city"));
						address.setAddress_district(rs.getString("address_district"));
						address.setAddress_detial(rs.getString("address_detial"));
				
						return address;
					}
				}
						
		
/**
 * FollowRowMapper
 */
				private class FollowRowMapper implements RowMapper<Integer>  {
					public Integer mapRow(ResultSet rs,int rowNum) throws SQLException{
						
						int follow = rs.getInt("follow_id");
				
						return follow;
					}
				}	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		
}






