<%@page import="java.sql.*"%>
<html>

    <head>

		<script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
    </script>


<%
// Cookie[] ck=request.getCookies();
String s2=null;
// if(ck!=null){
	// for(Cookie cookie:ck){
		// if(cookie.getName().equals("exam")){
			// s2=cookie.getValue();
		// }
		
	// }
// }
String s1=null;
s1=(String)session.getAttribute("un1");
if(s1==null|s2!=null){
	response.sendRedirect("stulogout.jsp");
}
else{
%>


        <link rel="stylesheet" type="text/css" href="exam.css">
		
    </head>
    <body>
		<form action="exam.jsp" method="post">
		
		<%!int c=1;
		
		%>
	<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
	
		if(s1.equals("ram")){
			response.sendRedirect("student.jsp");
		}
		
		
		String start=request.getParameter("start");
		if(start!=null){
		String subject=request.getParameter("subject");
			
			
		String q2="select * from question where  subject='"+subject+"'    ";
		ResultSet rs2=st.executeQuery(q2);
		if(rs2.next())
		{
			
			
			
			
			
		
		
		Cookie ck111=new Cookie("subject",subject);
		// ck.setMaxAge(60*60);
		response.addCookie(ck111);
		
		// HttpSession session1=request.getSession();
		// session.setAttribute("subject",subject);		
		session.setAttribute("c",c);
		
		
		Cookie ck222=new Cookie("aa","1");
		response.addCookie(ck222);
		
		
		
		String q="select * from courses where course_name='"+subject+"'";
		ResultSet rs=st.executeQuery(q);
		rs.next();
		int min=Integer.parseInt(rs.getString(2));
		int sec=Integer.parseInt(rs.getString(3));
		session.setAttribute("min",min);		
		session.setAttribute("sec",sec);		
		
		response.sendRedirect("exam1.jsp");
		}
		else
		{%>
			<script type="text/javascript">
			alert("Questions are not available for this subject");
			window.location.href("exam.jsp");
			</script>
			<%
		}
	}
	%>
		<center>
		
        <h2 class="inst"> Instructions</h2><br>
		<div class="v11"></div>
		<ul>
		<li><h4>You will get different time for every subject's test as decided by ADMIN.</h4></li>
		<li><h4>Option once selected cannot be deselected by another click on it.</h4></li>
		<li><h4>Once you start the test,timer will start and you will not be able to come back.</h4></li>
		<li><h4>If you try to come back or navigate through url you will be automatically logout.</h4></li>
		<li><h4>After submitting the test you can see the result of the test on result page.</h4></li>
		<li><h4>There is no minus marking for the test.</h4></li>
		<li><h4>You have to select subject for the test from below:- </h4></li>
		<select id="select" name="subject">
		<%
		
			
			String q1="select * from courses";
			ResultSet rs1=st.executeQuery(q1);
			while(rs1.next()){%>
			
		<option><%=rs1.getString(1)%></option>
			<%}
			con.close();
		}catch(Exception e){
			out.println(e);
		}%>
		</select>
		</ul>
		
		<input type="submit" id="button" value="START" name="start" >
     
		</center>
		
		</form>
    
    </body>
    
</html>
<%}%>