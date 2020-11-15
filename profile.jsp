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
        <link rel="stylesheet" type="text/css" href="profile.css">
		<script type="text/javascript">
	function demo(){
	if(uname()&name()&con()&email()&city()&gender()&dob()){
		return true;
	}
	else{
		return false;
	}
}

function uname(){
	a=document.getElementById("uname").value;
	if(a.length>=3){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid username";
		return false;
	}
}
function name(){
	a=document.getElementById("name").value;
	if(a.length>=3){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid name";
		return false;
	}
}
function con(){
	a=document.getElementById("con").value;
	var re=/^[6-9]\d{9}$/;
	if(re.test(a)){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid contact";
		return false;
	}
}
function email(){
	a=document.getElementById("email").value;
	var re=/^\w{3,30}\@gmail\.\w{3}$/;
	if(re.test(a)){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid email";
		return false;
	}
}
function city(){
	a=document.getElementById("city").value;
	if(a.length>=3){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid city";
		return false;
	}
}
function gender(){
	a=document.getElementById("gender").value;
	if(a.length>=3){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid gender";
		return false;
	}
}
function dob(){
	a=document.getElementById("dob").value;
	var re=/^\d{4}\-\d{2}\-\d{2}$/;
	if(re.test(a)){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid dob";
		return false;
	}
}

	</script>
    </head>
	<body>
		<%@include file="mymenu.jsp"%>
		<form action="profile.jsp" method="post">
	<div class="title">Profile</div>
        <div id="data3">
		<center>
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			
			String q="select * from admregis where username='"+s111+"'";
			ResultSet rs=st.executeQuery(q);
			if(rs.next()){
		%>
		<table cellpadding="12px" id="table" border="1">
		<span id="s2" style="color:red;"></span>
		<tr><br><br>
		<td id="abc"> Username:</td>
		<td id="def"><input type="text" value="<%=rs.getString(1)%>" name="uname" id="uname" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Your Name:</td>
		<td id="def"><input type="text" value="<%=rs.getString(2)%>" name="name" id="name" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Contact No:</td>
		<td id="def"><input type="text" value="<%=rs.getString(4)%>" name="con" id="con" class="t1"> </td>
		</tr>
		<td id="abc"> Email:</td>
		<td id="def"><input type="text" value="<%=rs.getString(5)%>" name="email" id="email" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> City:</td>
		<td id="def"><input type="text" value="<%=rs.getString(6)%>" name="city" id="city" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Gender:</td>
		<td id="def"><input type="text" value="<%=rs.getString(7)%>" name="gender" id="gender" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> DOB:</td>
		<td id="def"><input type="text" value="<%=rs.getString(8)%>" name="dob" id="dob" class="t1"> </td>
		</tr>
		<tr>
		<th colspan="2"><input type="submit" value="Update" name="upd" id="show" onclick="return demo()"> </td>
		</tr>
			<%}
		}
		catch(Exception e){
			out.println(e);
		}
		%>
		</form>
		</center>
		
		</table>   
        </div>
	</body>
</html>
<%
String s1=request.getParameter("upd");
if(s1!=null){
	String s2=request.getParameter("uname");
	String s3=request.getParameter("name");
	String s5=request.getParameter("con");
	String s6=request.getParameter("email");
	String s7=request.getParameter("dob");
	String s8=request.getParameter("city");
	String s9=request.getParameter("gender");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q1="update admregis set name='"+s3+"',Contact='"+s5+"',email='"+s6+"',dob='"+s7+"',city='"+s8+"',gender='"+s9+"' where username='"+s2+"'";
		st.executeUpdate(q1);
		response.sendRedirect("profile.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
}






}
%>