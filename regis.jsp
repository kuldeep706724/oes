<%@page import="java.sql.*"%>



<html>
<head>
    <link rel="stylesheet" type="text/css" href="style1.css">
<script type="text/javascript">
function demo(){
	document.getElementById("s2").innerHTML="";
	document.getElementById("s3").innerHTML="";
	document.getElementById("s4").innerHTML="";
	if(uname()&upass()&con()&mail()){
		return true;
	}
	else{
		return false;
	}
}
function uname(){
	a=document.getElementById("t2").value;
	if(a.length>=3){
		return true;
	}
	else{
		document.getElementById("s2").innerHTML="please enter valid name";
		return false;
	}
}
function upass(){
	a=document.getElementById("t3").value;
	if(a.length>=5){
		return true;
	}
	else{
		document.getElementById("s3").innerHTML="Enter password of length 5 or more";
		return false;
	}
}
function con(){
	a=document.getElementById("t4").value;
	var re=/^[6-9]\d{9}$/;
	if(re.test(a)){
		return true;
	}
	else{
		document.getElementById("s4").innerHTML="please enter valid number";
		return false;
	}
}
function mail(){
	a=document.getElementById("t5").value;
	var re=/^\w{3,30}\@gmail\.\w{3}$/;
	if(re.test(a)){
		return true;
	}
	else{
		document.getElementById("s5").innerHTML="please enter valid email";
		return false;
	}
}

</script>

	
</head>
    <body>
	<%@include file="index1.html"%>
    <div class="login-box">
    <img src="avatar.png" class="avatar">
	<h1>Register </h1>
            <form action="regis.jsp" name="abc" method="post">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username" required="required" id="t1">
			<span id="s1" style="color:red"></span>
            <p>Name</p>
            <input type="text" name="name" placeholder="Enter Name" id="t2" >
			<span id="s2" style="color:red"></span>
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password" id="t3">
			<span id="s3" style="color:red"></span>
			<p>Contact</p>
            <input type="text" name="contact" placeholder="Enter Contact" id="t4">
			<span id="s4" style="color:red"></span>
			<p>Email</p>
            <input type="text" name="email" placeholder="Enter Email" id="t5">
			<span id="s5" style="color:red"></span>
			<p>Date of Birth</p>
            <input type="date" name="dob" placeholder="Enter DOB" id="t6" required="required">
			<span id="s6" style="color:red"></span>
			<p>City</p>
            <input type="text" name="city" placeholder="Enter City" id="t7" required="required">
			<span id="s7" style="color:red"></span>
			<p>Gender</p><br>
            <input type="radio" name="a" value="MALE" id="a" required="required"> MALE
			<input type="radio" name="a" value="FEMALE" id="a" required="required">FEMALE
			
            <input type="submit" name="regis" value="Register" onclick="return demo()">
			
			<font> User Login?? Click &nbsp </font><a href="stulogin.jsp">here</a>
            </form>
        
        
        </div>
    
<%
String s1=request.getParameter("regis");
if(s1!=null){ 

String s2=request.getParameter("username");
	String s3=request.getParameter("name");
	String s4=request.getParameter("password");
	String s5=request.getParameter("contact");
	String s6=request.getParameter("email");
	String s7=request.getParameter("dob");
	String s8=request.getParameter("city");
	String s9=request.getParameter("a");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		 
		String q="select * from regis where Username='"+s2+"'";
		ResultSet rs=st.executeQuery(q);
		if(rs.next()){%>
			<script type="text/javascript">
			document.getElementById("s1").innerHTML="username already taken";
			</script>
<%
		}
		else{
			String q1="insert into regis values('"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s8+"','"+s9+"','"+s7+"','no')";
			st.executeUpdate(q1);
			%>
			<script type="text/javascript">
			alert("Registered Successfully");
			</script>
	<%
		}
		con.close();
	}catch(Exception e){
		out.println(e);
	}

}
%>

	
	
	
    </body>
</html>