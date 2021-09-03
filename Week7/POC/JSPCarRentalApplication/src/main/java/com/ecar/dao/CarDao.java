package com.ecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.ecar.beans.CarBean;
import com.ecar.beans.IssueCarBean;

public class CarDao {

	public static int save(CarBean bean){
		int status=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("insert into e_car values(?,?,?,?,?,?,?,?)");
			ps.setString(1,bean.getCarId());
			ps.setString(2, bean.getModelName());
			ps.setString(3, bean.getManufacturingYear());
			ps.setFloat(4, bean.getMileage());
			ps.setInt(5, bean.getSeatingcapacity());
			ps.setInt(6, bean.getPricePerDay());
			ps.setInt(7, bean.getQuantity());
			ps.setInt(8,0);
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static List<CarBean> view(){
		List<CarBean> list=new ArrayList<CarBean>();
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_car");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				CarBean bean=new CarBean();
				bean.setCarId(rs.getString("car_id"));
				bean.setModelName(rs.getString("model_name"));
				bean.setManufacturingYear(rs.getString("manufacturing_year"));
				bean.setMileage(rs.getFloat("mileage"));
				bean.setSeatingcapacity(rs.getInt("seating_capacity"));
				bean.setPricePerDay(rs.getInt("price_per_day"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setIssued(rs.getInt("issued"));
				list.add(bean);
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	
	public static List<CarBean> viewAvailableCars(){
		List<CarBean> list=new ArrayList<CarBean>();
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_car where ISSUED=0");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				CarBean bean=new CarBean();
				bean.setCarId(rs.getString("car_id"));
				bean.setModelName(rs.getString("model_name"));
				bean.setManufacturingYear(rs.getString("manufacturing_year"));
				bean.setMileage(rs.getFloat("mileage"));
				bean.setSeatingcapacity(rs.getInt("seating_capacity"));
				bean.setPricePerDay(rs.getInt("price_per_day"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setIssued(rs.getInt("issued"));
				list.add(bean);
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static int delete(String car_id){
		int status=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("delete from e_car where car_id=?");
			ps.setString(1,car_id);
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static int getIssued(String car_id){
		int issued=0;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_car where car_id=?");
			ps.setString(1,car_id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				issued=rs.getInt("issued");
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return issued;
	}
	public static boolean checkIssue(String car_id){
		boolean status=false;
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_car where car_id=? and quantity>issued");
			ps.setString(1,car_id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				status=true;
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static int issueCar(IssueCarBean bean){
		String carId=bean.getCarId();
		boolean checkstatus=checkIssue(carId);
		System.out.println("Check status: "+checkstatus);
		if(checkstatus){
			int status=0;
			Connection con=null;
			try{
				con =  ConnectionProvider.getCon();
				PreparedStatement ps=con.prepareStatement("insert into e_issuecar values(?,?,?,?,?,?,?)");
				ps.setString(1,bean.getCarId());
				ps.setString(2,bean.getCustomerId());
				ps.setString(3,bean.getCustomerName());
				ps.setString(4,bean.getLicenseNumber());
				ps.setLong(5, bean.getCustomerMobile());
				java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());
				ps.setDate(6,currentDate);
				ps.setString(7,"no");
				
				status=ps.executeUpdate();
				if(status>0){
					PreparedStatement ps2=con.prepareStatement("update e_car set issued=? where car_id=?");
					ps2.setInt(1,getIssued(carId)+1);
					ps2.setString(2,carId);
					status=ps2.executeUpdate();
				}
				
			}catch(Exception e){System.out.println(e);}
			
			return status;
		}else{
			return 0;
		}
	}
	public static int returnCar(String carId,int customerId){
		int status=0;
		Connection con=null;
			try{
				con =  ConnectionProvider.getCon();
				PreparedStatement ps=con.prepareStatement("update e_issuecar set returnstatus='yes' where car_id=? and customerid=?");
				ps.setString(1,carId);
				ps.setInt(2,customerId);
				
				status=ps.executeUpdate();
				if(status>0){
					PreparedStatement ps2=con.prepareStatement("update e_car set issued=? where car_id=?");
					ps2.setInt(1,getIssued(carId)-1);
					ps2.setString(2,carId);
					status=ps2.executeUpdate();
				}
				
			}catch(Exception e){System.out.println(e);}
			
			return status;
	}
	public static List<IssueCarBean> viewIssuedCars(){
		List<IssueCarBean> list=new ArrayList<IssueCarBean>();
		Connection con=null;
		try{
			con =  ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("select * from e_issuecar order by issueddate desc");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				IssueCarBean bean=new IssueCarBean();
				bean.setCarId(rs.getString("car_id"));
				bean.setCustomerId(rs.getString("customerid"));
				bean.setCustomerName(rs.getString("customername"));
				bean.setLicenseNumber(rs.getString("licensenumber"));
				bean.setCustomerMobile(rs.getLong("Customermobile"));
				bean.setIssuedDate(rs.getDate("issueddate"));
				bean.setReturnStatus(rs.getString("returnstatus"));
				list.add(bean);
			}
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	
}
