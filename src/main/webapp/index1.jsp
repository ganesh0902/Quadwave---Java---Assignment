<%@page import="com.emp.utility.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.emp.daoImpl.*" %>
<%@page import="java.util.*" %> 
  <%@page import="com.emp.model.*" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
			
				<script
					  src="https://code.jquery.com/jquery-3.6.1.min.js"
					  integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
					  crossorigin="anonymous">
				
				</script>
										
		<style type="text/css">
		
body{
	
		background-image: url("https://i.pinimg.com/736x/d1/9b/da/d19bda2dd426a379097d18b2af9ec7aa.jpg");			
}		
												
#parent{
											
	border: 1px solid black;						
	margin-right: 200px;
	margin-left: 100px;	
	
}
						
#parent #search{
					
	position: relative;
	left: 80px;
	top: 20px;	
	width: 200px;
	background-color: red;
	border-radius: 20px;										
}  
#parent #search input{
					
	width: 200px;	
	border-radius: 20px;
	color: black;	
	padding: 10px;		 
			
} 
#parent #Add{
			
	position: relative;
	top: -20px;
	right: 40px;
	background-color: red;
	width: 00px;
									
} 
#parent #Add #show-popup-btn{
			
	background-color: #EA4C89;	
	border-radius: 8px;
	border-style: none;
	box-sizing: border-box;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: 500;
	height: 40px;
	line-height: 20px;
	list-style: none;
	margin: 0;
	outline: none;
	padding: 10px 16px;
	position: relative;
	left:1100px;
	width:90px;
	text-align: center;
	text-decoration: none;
	transition: color 100ms;
	vertical-align: baseline;
	user-select: none;
	 -webkit-user-select: none;
	touch-action: manipulation;													
}
#parent #Add #show-popup-btn:hover,
	.button-1:focus {
	background-color: #F082AC;
}
#parent #child{
			
	text-align: center;
	position: relative;
	left:80px;										
	margin: 10px 130px 30px -20px;		
}
			
#child td,th{
			
	padding: 10px 80px 10px 80px;
			
}		
#forms{
			
	width:50%;
	height:400px;
	border:2px solid black;										
	position: relative;
	left: 400px;
	top: -400px;
	background-color: #1C6A9C ;
	color: white;
}
#forms #box{
			
	margin-top: 50px;			
}							
#forms #box #eid{
			
	width:250px;
	height:25px;
	position: relative;
	left: 120px;			
}
#forms #box #ename{
			
	width:250px;
	height:25px;
	position: relative;
	left: 87px;			
}
#forms #box #doj{
			
	width:250px;
	height:25px;
	position: relative;
	left: 87px;			
}
#forms #box #yoe{
			
	width:250px;
	height:25px;
	position: relative;
	left: 50px;			
}
#forms #box #designation{
			
	width:250px;
	height:25px;
	position: relative;
	left: 110px;			
}
#forms #box #Save{
			
	width:100px;
	height:35px;
	position: relative;
	left: 320px;
	background-image: linear-gradient(-180deg, #37AEE2 0%, #1E96C8 100%);
	border-radius: .5rem;
	box-sizing: border-box;
	color: #FFFFFF;
	display: flex;
	font-size: 16px;
	justify-content: center;
	padding: 10px 20px 10px 20px
	text-decoration: none;
	width: 120px;
	border: 0;
	cursor: pointer;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation; 			
}
#forms #box #Save:hover {
  background-image: linear-gradient(-180deg, #1D95C9 0%, #17759C 100%);
}
#forms #box #cancel{
			
	 position: relative;
	left: 400px;
	padding: 6px 15px 6px 15px; 
	
 background-image: linear-gradient(-180deg, #37AEE2 0%, #1E96C8 100%);
  border-radius: .5rem;
  box-sizing: border-box;
  color: #FFFFFF;
  display: flex;
  font-size: 16px;
  justify-content: center;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  width: 120px;
  border: 0;
  cursor: pointer;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  position: relative;
  left: 500px;
  top: -35px;
 	
}
#forms #box #cancel:hover {
  background-image: linear-gradient(-180deg, #1D95C9 0%, #17759C 100%);
}

#forms #box label{
			
		margin-left: 100px;					
}	
</style>					
</head>
<body>		
				
		<h1 style="margin-left: 200px";> Employee Details</h1>
		
		<section id="parent">
								 
					<form action="searchMethod" method="get">
												
					 <div id="search">
					 
							<input type="text" name="eid" placeholder="Search">							
					
					</div>							
					<div id="Add">
												
							<input type="button" id="show-popup-btn" value="Add">
					
					</div>
					</form>		
							
		<section id="child">
		
						<%						
							DaoImpl e=new DaoImpl(); //create object of DaoImpl to Fetch all Record from database
						
							List<Employee> e1=e.getEmployee();
																																																								
						%>																								 				
					<table border="1">
						<tr style="color: white">
							<th> ID</th>
							<th> FName </th>
							<th> DOJ</th>
							<th> YOE </th>
							<th> Designation</th>						
						</tr>						
								<%																						
								HttpSession se = request.getSession(false);								
								Integer i=(Integer)se.getAttribute("id");//i is 0 mean Record is not fuld							
								if(i==0)
								{
										out.println("<h1 style='color:red'> Record is Not Found </h1>");											
								}
								else if(i>=1)
								{										
									out.println("<tr style='background:lightgrey;color:#FF0000;'>");
									out.println("<td> "+request.getAttribute("id")+" </td>");
									out.println("<td> "+request.getAttribute("name")+" </td>");
									out.println("<td> "+request.getAttribute("doj")+"</td>");
									out.println("<td> "+request.getAttribute("yoe")+"</td>");
									out.println("<td> "+request.getAttribute("des")+"</td>");
									out.println("</tr>");
								}						
								%>																				
							<%
								for(Employee emp:e1)//iterate the All record from List<Employee> and display in tabular format
								{
								%>
								<tr style="color: white">
									
									<td><%=emp.getId() %></td>
									<td><%=emp.getEName() %></td>
									<td><%=emp.getDoj() %></td>
									<td><%=emp.getYoe() %></td>
									<td><%=emp.getDesignation() %></td>								
							</tr>		
							<% 	
								 }
							%>											
				</table>																	
			</section>	
		</section>						
		<section id="forms" name="forms">
						
				<form action="saveRecord" method="get">
								<h1 style="margin-left: 100px"> ADD EMPLOYEE</h1>
				<div id="box">							
							<label> EMPLOYEE ID</label>
							
							<select name="Eid" id="eid">
									<option  style="padding: 15px 0px">Select Id</option>	
									<option>101</option>
									<option>102</option>
									<option>103</option>
									<option>104</option>
									<option>105</option>
									<option>106</option>
									<option>107</option>
									<option>108</option>
									<option>109</option>
									<option>110</option>
							
							</select><br><br>							
							<label>EMPLOYEE NAME</label>
							<input type="text" name="Fname" id="ename"><br><br>
							<label>DATE OF JOINING</label>
							<input type="text" name="doj" id="doj"><br><br>
							<label>YEAR OF EXPERIENCE</label>
							<input type="number" name="yoe" id="yoe"><br><br>
							<label>DESIGNATION</label>
							<input type="text" name="designation" id="designation"><br><br>							
							<input type="submit" id="Save">							
							<input type="button" id="cancel" value="Cancel">															
				</div>																
			</form>				
		</section>	
		<script> //JQuery Logic when user click on ADD Button form should be open
		$('#forms').hide(); 
		 $("#show-popup-btn").click(function() {
			 
			   $('#forms').toggle(); 			  			  
		});
		 $("#cancel").click(function() //when user click on CANCEL Button form should be hide 
		{
			 
			   $('#forms').hide(); 			  			  
		});	
		 			
		</script>																			
</body>
</html>