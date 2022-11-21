package com.emp.Dao;

import java.util.List;

import com.emp.model.Employee;

public interface EmpDao {
	
	
	public List<Employee> getEmployee();
	public boolean Save(Employee e);
	public Employee getEmp(int id); 
}
