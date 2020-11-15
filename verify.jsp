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
        <link rel="stylesheet" type="text/css" href="verify.css">
    </head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="verify.jsp">
		
	
	
		<div class="title1">Unverified Users</div>
		<%
		 int x=120;
		int count=0;
		int temp=0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			String q1="select count(*) from regis where verify='no'";
			ResultSet rs1=st.executeQuery(q1);
			rs1.next();
			count=Integer.parseInt(rs1.getString(1));
			
		if(count>temp){
			while(count>temp){
				x+=60;
				temp++;
			}
		}%>
		        <div id="data4" style="height:<%=x%>;">
			<center>
			<table id="table1" cellpadding="15px" border="12">
			<tr><br><br>
			<th id="abc">Users</th>
			<th id="def"> Verify</th>
			</tr>
		<%
				
				String q="select*from regis where verify='no'";
				ResultSet rs=st.executeQuery(q);
				while(rs.next()){%>
			<tr>
			<td id="abc"><%=rs.getString(1)%></td>
			<td>
			
			<a  href="verify.jsp?verify=<%=rs.getString(1)%>" 
                onclick="return confirm('Are you sure you want to verify this ?');">
                <div style="max-width: 40px;font-size: 17px; padding: 3px;color:white;">verify</div>
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

String s2=request.getParameter("verify");
if(s2!=null){
	
	String verify=request.getParameter("verify");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="update regis set verify='yes' where username='"+verify+"'";
		st.executeUpdate(q);
		
		response.sendRedirect("verify.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}

}
%>

