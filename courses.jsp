<%@page import="java.sql.*"%>
<%

String s111=null;

s111=(String)session.getAttribute("un");
if(s111==null){
	response.sendRedirect("adm-logout.jsp");
}
else{
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="courses.css">
		<script type="text/javascript">
		function demo(){
			if(course()&&mins()&&secs()){
				return true;
			}
			else{
				return false;
			}
		}
		function course(){
			a=document.getElementById("cours").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("c1").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		function mins(){
			a=document.getElementById("min").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("c1").innerHTML="*All fields are mandatory ";
				return false;
			}
		}
		function secs(){
			a=document.getElementById("sec").value;
			if(a<60&a>=0){
				return true;
			}
			else{
				document.getElementById("c1").innerHTML="Invalid Seconds";
				return false;
			}
		}
		</script>
    </head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="courses.jsp">
		
		
	<div class="title">Add New Course</div>
        <div id="data3">
		<center>
		
		<span id="c1" style="color:red;margin-left:30%;"></span>
		
		<table cellpadding="12px" id="table" border="12" style="box-shadow: 0 0 19px 1px black;">
		<tr><br><br>
		<td id="abc"> Course Name:</td>
		<td id="def"><input type="text" name="course" id="cours" required="required"> </td>
		</tr>
		<tr>
		<th colspan="2" style="color:white;font-size:20px;">TIME</th>
		</tr>
		<tr>
		<td id="abc"> Minutes:</td>
		<td id="def"><input type="text" name="mins" id="min" required="required"> </td>
		<span id="c2" style="color:red;"></span>
		</tr>
		<tr>
		<td id="abc"> Seconds:</td>
		<td id="def"><input type="text" name="secs" id="sec" required="required"> </td>
		<span id="c3" style="color:red;"></span>
		</tr>
		
		<th colspan="2"><input type="submit" value="DONE" name="upd" onclick="return demo()" id="button"> </td>
		</tr>
		</center>
		
		</table>   
        </div>
		
		
		<%
		 int x=120;
		int count=0;
		int temp=0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			String q1="select count(*) from courses";
			ResultSet rs1=st.executeQuery(q1);
			rs1.next();
			count=Integer.parseInt(rs1.getString(1));
			
		if(count>temp){
			while(count>temp){
				x+=60;
				temp++;
			}
		}
		%>
		<div class="title1">All Courses</div>
        <div id="data4" style="height:<%=x%>;">
		<%
			
			String q="select * from courses";
			ResultSet rs=st.executeQuery(q);
			
			%>
			<center>
			<table id="table1" cellpadding="15px" border="12" style="    box-shadow: 0 0 19px 1px black;">
			<tr><br><br>
			<th id="abc">Courses</th>
			<th id="abc">Time</th>
			<th id="def"> Delete</th>
			</tr>
			<%
			while(rs.next()){%>
			<tr>
			<td id="abc"><%=rs.getString(1)%></td>
			<td id="abc"><%=rs.getString(2)+":"+rs.getString(3)%></td>
			<td>
			<a  href="courses.jsp?delete=<%=rs.getString(1)%>" 
                onclick="return confirm('Are you sure you want to delete this?...this will delete all questions of this course');">
                <div style="max-width: 40px;font-size: 17px; padding: 3px; color:white;">XX</div>
            </a>
			</td>
			</tr>
		
			<%}
			con.close();
		}
		catch(Exception e){
			out.println(e);
		}
			
			
			%>
			</center>
		</table>   
        </div>
		
		
	</form>
	</body>
</html>
<%
String s1=request.getParameter("upd");
if(s1!=null){
	
	String course=request.getParameter("course");
	String mins=request.getParameter("mins");
	String secs=request.getParameter("secs");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="insert into courses values('"+course+"','"+mins+"','"+secs+"')";
		st.executeUpdate(q);
		response.sendRedirect("courses.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}


String s2=request.getParameter("delete");
if(s2!=null){
	
	String course1=request.getParameter("delete");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="delete from courses where course_name='"+course1+"'";
		st.executeUpdate(q);
		String q1="delete from question where subject='"+course1+"'";
		st.executeUpdate(q1);
		
		response.sendRedirect("courses.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}






}
%>
