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
        <style type="text/css">
		body{
    background-color: grey;
}
#data3{
  width: 26%;
    height: 166px;
     background-color: rebeccapurple;
    background-repeat: no-repeat;
    float: left;
    margin-left: 45%;
	border-radius:12px;
    margin-top: -2%;
box-shadow: inset 0 0 20px 10px black;
	
}
#data31{
    width: 52%;
    height: 34px;
    background-color: darkslategrey;
    background-repeat: no-repeat;
    float: left;
    margin-left: 77px;
    margin-top: 16%;
    color: white;
    font-weight: bold;
    font-size: 20px;
    box-shadow: inset 0 0 20px 0px black;
    border: none;
}
.title{
   position: relative;
    height: 40px;
    padding-top: 17px;
    float: right;
    padding-left: 15px;
    padding-right: 15px;
    font-size: 21px;
    color: white;
    border-radius: 4px;
    margin-right: 41%;
    text-align: center;
    margin-top: 14%;
    background: linear-gradient(60deg, #ffa726, #fb8c00);
    box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(233, 0, 0, 0.4);
}
#show{
	width: 59%;
     border: none;
    outline: none;
    height: 40px;
    background: #1c8adb;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
    margin-left: 19%;
	
}
#show:hover{
	cursor: pointer;
    background: #39dc79;
    color: #000;
}


	
	</style>	

    </head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="adm-result1.jsp" method="post">
	<div class="title">Show Result Of</div>
	
        <div id="data3">
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			
			String q="select * from regis";
			ResultSet rs=st.executeQuery(q);
			
		%>
		<select id="data31" style="text-align:center;" name="n1">
		<%while(rs.next()){%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%> </option>
		<%}%>
		</select>
		<br><br><br><br><br><br>
		<input type="submit" value="show" name="show" id="show">
        </div>
		
		<%	
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
