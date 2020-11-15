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
        <link rel="stylesheet" type="text/css" href="accounts.css">
    </head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="accounts.jsp" method="post">
	<div class="title">Registered Users</div>
	<%
	 int x=120;
		int count=0;
		int temp=0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			String q1="select count(*) from regis";
			ResultSet rs1=st.executeQuery(q1);
			rs1.next();
			count=Integer.parseInt(rs1.getString(1));
			
		if(count>temp){
			while(count>temp){
				x+=90;
				temp++;
			}
		}
		%>
        <div id="data3" style="height:<%=x%>">
		<center>
		<table cellpadding="20px" id="table" border="1">
		<tr><br><br>
		<th id="abc"> Username:</th>
		<th id="abc"> Name:</th>
		<th id="abc"> Email:</th>
		<th id="abc"> Contact No:</th>
		<th id="abc"> City:</th>
		<th id="abc"> Gender:</th>
		<th id="abc"> DOB:</th>
		<th id="abc"> Delete:</th>
		</tr>
		<%
			String q="select * from regis";
			ResultSet rs=st.executeQuery(q);
			while(rs.next()){
		%>
		<tr id="def">
		<td><%=rs.getString(1)%>
		</td>
		<td><%=rs.getString(2)%>
		</td>
		<td><%=rs.getString(5)%>
		</td>
		<td><%=rs.getString(4)%>
		</td>
		<td><%=rs.getString(6)%>
		</td>
		<td><%=rs.getString(7)%>
		</td>
		<td><%=rs.getString(8)%>
		</td>
		<td>
		
		<a  href="accounts.jsp?del=<%=rs.getString(1)%>" 
                onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="title1">DELETE</div>
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
		
		</form>
		</center>
		
		</table>   
        </div>
	</body>
</html>
<%
String s1=request.getParameter("del");
if(s1!=null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="delete from regis where Username='"+s1+"'";
		st.executeUpdate(q);
		response.sendRedirect("accounts.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}

}
%>