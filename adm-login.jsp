<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Demo1.css">
</head>
<body>

<%@include file="index1.html"%>
<div class="login-box">
    <img src="avatar.png" class="avatar">
        <h1>Admin Login </h1>
            <form action="adm-login.jsp" method="post">
            <p>Username</p>
            <input type="text" name="un" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="up" placeholder="Enter Password">
            <input type="submit" name="b1" value="Login">
			
			<font> New Admin?? Click &nbsp </font><a href="adm-regis.jsp">here</a>
            </form>
        
        
        </div>

<% 
String s11=request.getParameter("b1");
if(s11!=null){
		String s1=request.getParameter("un");
		String s2=request.getParameter("up");
		%>
		<html>
		<body>
		<% try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			Statement st=con.createStatement();
			String q="select * from admregis where Username='"+s1+"'and Password='"+s2+"'";
			ResultSet rs=st.executeQuery(q);
			if(rs.next()){
				// Cookie ck=new Cookie("un",s1);
				// ck.setMaxAge(60*60);
				// response.addCookie(ck);
				// HttpSession session=request.getSession();
				session.setAttribute("un",s1);
				response.sendRedirect("admin.jsp");
				
			}
			else{
				%>
		<script type='text/javascript'>
		
		alert('invalid username or pass');
		window.location = 'adm-login.jsp';
		
		</script>
				
		<% } 
			
			con.close();
		}
		catch(Exception e){
			out.println(e);
		}
}
%>

</body>
</html>

