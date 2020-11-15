<%@page import="java.sql.*"%>
<%
Cookie[] ck1=request.getCookies();
String ck11=null;
if(ck1!=null){
	for(Cookie cookie:ck1){
		if(cookie.getName().equals("exam")){
			ck11=cookie.getValue();
		}
	}
}
String s11=null;
s11=(String)session.getAttribute("un1");
if(s11==null|ck11!=null){
	response.sendRedirect("stulogout.jsp");
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
	
	<%@include file="student.jsp"%>
		<form action="stuprof.jsp" method="post">
	<div class="title">Profile</div>
        <div id="data3">
		<center>
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			
			String q="select * from regis where UserName='"+s11+"'";
			ResultSet rs=st.executeQuery(q);
			if(rs.next()){
		%>
		<table cellpadding="12px" id="table" border="1">
		<tr><br><br>
		<td id="abc"> Username:</td>
		<td id="def"><input type="text" value="<%=rs.getString(1)%>" name="uname" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Your Name:</td>
		<td id="def"><input type="text" value="<%=rs.getString(2)%>" name="name" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Contact No:</td>
		<td id="def"><input type="text" value="<%=rs.getString(4)%>" name="con" class="t1"> </td>
		</tr>
		<td id="abc"> Email:</td>
		<td id="def"><input type="text" value="<%=rs.getString(5)%>" name="email" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> City:</td>
		<td id="def"><input type="text" value="<%=rs.getString(6)%>" name="city" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> Gender:</td>
		<td id="def"><input type="text" value="<%=rs.getString(7)%>" name="gender" class="t1"> </td>
		</tr>
		<tr>
		<td id="abc"> DOB:</td>
		<td id="def"><input type="text" value="<%=rs.getString(8)%>" name="dob" class="t1"> </td>
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
		
		String q1="update regis set name='"+s3+"',Contact='"+s5+"',email='"+s6+"',dob='"+s7+"',city='"+s8+"',gender='"+s9+"' where username='"+s2+"'";
		st.executeUpdate(q1);
		response.sendRedirect("stuprof.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
}






}
%>