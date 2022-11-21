package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.daoImpl.DaoImpl;
import com.emp.model.Employee;

@WebServlet("/searchMethod")
public class searchMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Object attribute;
           
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
    	PrintWriter out = response.getWriter();
    		
    		int eid=Integer.parseInt(request.getParameter("eid"));
    		
    		Employee e=new Employee();
    		e.setId(eid);
    		
    		    		
    		DaoImpl emp=new DaoImpl();    		    		
    		Employee emp2 = emp.getEmp(eid);
    		
    		
//    		System.out.println("emp id is "+emp2.getId());
//    		System.out.println(emp2.getId());
//    		System.out.println(emp2.getEName());
//    		System.out.println(emp2.getDoj());
//    		System.out.println(emp2.getYoe());
//    		System.out.println(emp2.getDesignation());
    		    	    	
			
			  request.setAttribute("id",emp2.getId());
			  request.setAttribute("name",emp2.getEName());
			  request.setAttribute("doj",emp2.getDoj());
			  request.setAttribute("yoe",emp2.getYoe());
			  request.setAttribute("des",emp2.getDesignation());
				
				
				  HttpSession session = request.getSession(true);
				  
				 session.setAttribute("id",emp2.getId());
				 				 								 			  	 
			  RequestDispatcher dis = request.getRequestDispatcher("index1.jsp");    	
			 dis.forward(request, response);      					
			}
}