<%@page import="java.sql.*"%>
<%

String s111=null;

s111=(String)session.getAttribute("un");
if(s111==null){
	response.sendRedirect("login1.jsp");
}
else{
	%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="show.css">
    </head>
	<body>
	<form>
	<%@include file="mymenu.jsp"%>
	<%
	String course=(String)session.getAttribute("course");
		int count=0; 
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		String q1="select count(*) from question where subject='"+course+"'";
		ResultSet rs1=st.executeQuery(q1);
		rs1.next();
		count=Integer.parseInt(rs1.getString(1));
		
		String q="select * from question where subject='"+course+"'";
		ResultSet rs=st.executeQuery(q);
		while(rs.next()){
	%>
	
	<div class="title"><%=rs.getString(1)%></div>
        <div id="data3">
		<br>
		<center>
		<h3><%=rs.getString(2)%></h3>
	
		
		
		<p id="opt"><%=rs.getString(3)%></p>
		<p id="opt"><%=rs.getString(4)%></p>
		<p id="opt"><%=rs.getString(5)%></p>
		<p id="opt"><%=rs.getString(6)%></p>
		<h3 id="opt2"><%=rs.getString(7)%></h3>
		<h3 id="opt2">correct option</h3>
		</center>
        </div>
		<a  href="show.jsp?qid=<%=rs.getString(1)%>" 
                onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="title1">DELETE</div>
            </a>
		<%
		count++;
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

<%
String s2=request.getParameter("qid");
if(s2!=null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="delete from question where Question_id='"+s2+"' and subject='"+course+"'";
		st.executeUpdate(q);
		
		int drop=Integer.parseInt(s2);
		
		int serial=1;
		for(int i=1;i<=count;i++){
			if(i!=drop){
			String q1="update question set Question_id='"+serial+"'where Question_id='"+i+"' and subject='"+course+"'";
			st.executeUpdate(q1);
			serial++;
			}
		}
		response.sendRedirect("show.jsp");
		
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}


}


}
%>

