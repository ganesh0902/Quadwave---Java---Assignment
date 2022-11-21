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

/**
 * Servlet implementation class saveRecord
 */
@WebServlet("/saveRecord")
public class saveRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		
		int eid=Integer.parseInt(request.getParameter("Eid"));
		String fname=request.getParameter("Fname");		
		int yoe=Integer.parseInt(request.getParameter("yoe"));
		String designation=request.getParameter("designation");
		
		Employee e=new Employee();
		
		e.setId(eid);
		e.setEName(fname);
		e.setYoe(yoe);
		e.setDesignation(designation);
		
		DaoImpl  emp=new DaoImpl();
		
		boolean save = emp.Save(e); //if the Employee Id is already exist then it return the true
				
		HttpSession session = request.getSession(false);			
		session.setAttribute("Record",save);
								
		RequestDispatcher re=request.getRequestDispatcher("index1.jsp");
		re.include(request, response);
	}
}