package com.ecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecar.beans.CarProviderBean;

public class CarProviderDao {

	public static int save(CarProviderBean bean){
		int status=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("insert into e_carprovider(full_name,email,password,mobile) values(?,?,?,?)");
			ps.setString(1,bean.getFullName());
			ps.setString(2,bean.getEmail());
			ps.setString(3,bean.getPassword());
			ps.setString(4,bean.getMobile());
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static int update(CarProviderBean bean){
		int status=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("update e_carprovider set full_name=?,email=?,password=?,mobile=? where id=?");
			ps.setString(1,bean.getFullName());
			ps.setString(2,bean.getEmail());
			ps.setString(3,bean.getPassword());
			ps.setString(4,bean.getMobile());
			ps.setInt(5,bean.getId());
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static List<CarProviderBean> view(){
		List<CarProviderBean> list=new ArrayList<CarProviderBean>();
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_carprovider");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				CarProviderBean bean=new CarProviderBean();
				bean.setId(rs.getInt("id"));
				bean.setFullName(rs.getString("full_name"));
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setMobile(rs.getString("mobile"));
				list.add(bean);
			}
			
		}catch(Exception e){System.out.println(e);}
		
		
		return list;
	}
	public static CarProviderBean viewById(int id){
		CarProviderBean bean=new CarProviderBean();
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_carprovider where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				bean.setId(rs.getInt(1));
				bean.setFullName(rs.getString(2));
				bean.setPassword(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setMobile(rs.getString(5));
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return bean;
	}
	public static int delete(int id){
		int status=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("delete from e_carprovider where id=?");
			ps.setInt(1,id);
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}

	public static boolean authenticate(String email,String password){
		boolean status=false;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_carprovider where email=? and password=?");
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				status=true;
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
}


