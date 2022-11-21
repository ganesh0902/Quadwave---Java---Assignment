package com.emp.model;

import java.util.Date;

public class Employee {
	
	private int id;
	private String EName;
	private String doj;
	private int yoe;
	private String Designation;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(int id, String eName, String date, int yoe, String designation) {
		super();
		this.id = id;
		EName = eName;
		this.doj = date;
		this.yoe = yoe;
		Designation = designation;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEName() {
		return EName;
	}
	public void setEName(String eName) {
		EName = eName;
	}
	
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public int getYoe() {
		return yoe;
	}
	public void setYoe(int yoe) {
		this.yoe = yoe;
	}
	public String getDesignation() {
		return Designation;
	}
	public void setDesignation(String designation) {
		Designation = designation;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", EName=" + EName + ", date=" + doj + ", yoe=" + yoe + ", Designation="
				+ Designation + "]";
	}
}
