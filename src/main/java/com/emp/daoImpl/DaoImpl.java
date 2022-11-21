package com.emp.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import com.emp.Dao.EmpDao;
import com.emp.model.Employee;
import com.emp.utility.DbConnection;

public class DaoImpl implements EmpDao{

	@Override
	public List<Employee> getEmployee()  {
		// fetch all record from database
		 List<Employee> emps = new LinkedList<Employee>();
		try
		{	
			String query="select * from employee";			
			Connection con = DbConnection.getConnection();
			Statement st=con.createStatement();
			
			ResultSet result = st.executeQuery(query);
			
			while(result.next())
			{
				Employee e=new Employee();
				
				e.setId(result.getInt(1));
				e.setEName(result.getString(2));				
				e.setDoj(result.getString(3));
				e.setYoe(result.getInt(4));
				e.setDesignation(result.getString(5));
				emps.add(e);				
			}
						
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return emps;
	}

	@Override
	public boolean Save(Employee e) {
		// Save all record which is submited from index page
		boolean found=false;
		try
		{
			Connection con = DbConnection.getConnection();
			Statement st=con.createStatement();
		
				String query="select * from employee";
				
				ResultSet res = st.executeQuery(query);
				
				while(res.next())
				{
					if(res.getInt(1)==e.getId())
					{
						found=true;
					}
				}
				if(found==false)//if Id is not duplicate then we are going to save record
				{
			PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?)");
		
			
			 	long millis=System.currentTimeMillis();  
		        java.sql.Date dates=new java.sql.Date(millis);  
		      						
			 ps.setInt(1,e.getId());
			 ps.setString(2,e.getEName());
			ps.setDate(3,dates);
			 ps.setInt(4,e.getYoe());
			 ps.setString(5,e.getDesignation());
			 
			 int update = ps.executeUpdate();
			 System.out.println("Record "+update);
			}			
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}						
		return found;
	}	
	@Override
	public Employee getEmp(int id) {
		// TODO Auto-generated method stub
		Employee emp=new Employee();
		
		try
		{
			boolean found=false;			
			Connection con = DbConnection.getConnection();
			
			Statement s=con.createStatement();
			
			PreparedStatement pr=con.prepareStatement("select * from employee where id=?");
			
			pr.setInt(1,id);
			
			ResultSet result = pr.executeQuery();
			
			while(result.next())
			{								
				emp.setId(result.getInt(1));
				emp.setEName(result.getString(2));
				emp.setDoj(result.getString(3));
				emp.setYoe(result.getInt(4));
				emp.setDesignation(result.getString(5));				
			}		
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}		
		return emp;
	}
}