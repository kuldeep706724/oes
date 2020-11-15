<%@page import="java.sql.*"%>
<%
Cookie[] ck11=request.getCookies();
String ck1=null;
if(ck11!=null){
	for(Cookie cookie:ck11){
		if(cookie.getName().equals("exam")){
			ck1=cookie.getValue();
		}
	}
}
String scc=null;
scc=(String)session.getAttribute("un1");
if(scc==null|ck1!=null){
	response.sendRedirect("stulogout.jsp");
}
else{



%>
<html>
    <head>
        <style type="text/css">
		body{
    background-color: grey;
}
#data3{
    width: 60%;
    height: 204px;
    background-color: darkcyan;
    background-repeat: no-repeat;
    float: right;
    border-radius: 22px;
    margin-right: 174px;
    margin-top: -2%;
    box-shadow: 6px 7px 5px 4px black;

}


.title{
    position: relative;
    height: 40px;
    padding-top: 17px;
    float: left;
    padding-left: 15px;
    padding-right: 15px;
    font-size: 21px;
    color: white;
    border-radius: 4px;
    margin-left: 30%;
    text-align: center;
    margin-top: 8%;
    background: linear-gradient(60deg, #ffa726, #fb8c00);
    box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(233, 0, 0, 0.4);
}

.title1{
    position: relative;
    height: 38px;
    padding-top: 11px;
    float: left;
    padding-left: 14px;
    padding-right: 13px;
    font-size: 21px;
    color: white;
    border-radius: 4px;
    margin-left: 77%;
    text-align: center;
    margin-top: -225px;
    background: linear-gradient(60deg, #29ff26, #1400fb);
    box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(233, 0, 0, 0.4);
}


#opt{
	margin-left:20px;
}
#opt2{
	margin-left:62%;
	margin-top:-8%;
}

	
	</style>	
    </head>
	<body>
	<form>
	<%@include file="student.jsp"%>
	
	
	
	
	
	
	
	
	<%
	
	String un=(String)session.getAttribute("un1");
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="select * from result where username='"+un+"'";
		ResultSet rs=st.executeQuery(q);
		while(rs.next()){
	%>
	
	<div class="title"><%=rs.getString(1)%></div>
        <div id="data3">
		<br>
		<center>
		<h3> Total Marks <%=rs.getString(2)%></h3>
	
		
		
		<p id="opt">Marks Obtained : <%=rs.getString(3)%></p>
		<p id="opt">Correct Answer : <%=rs.getString(4)%></p>
		<p id="opt">Wrong Answer : <%=rs.getString(5)%></p>
		<%
		
		if(rs.getString(6).equals("pass")){%>
		<p id="opt" style="color:green;font-weight: bold;">Result : <%=rs.getString(6)%></p>
		<%}
		else{%>
		<p id="opt" style="color:red;font-weight: bold;">Result : <%=rs.getString(6)%></p>
		<%}%>	
		</center>
        </div>
		<div class="title1"><%=rs.getString(7)%></div>
		<%
		}
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
		
		%>
		
		
		
	</form>
	</body>
</html>

<%}%>
