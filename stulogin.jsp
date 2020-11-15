<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Demo1.css">
</head>
<body>

<script type="text/javascript">// <![CDATA[
// bajb_backdetect.OnBack = function(){
    // window.location = 'home.jsp'; //Change the url here with your desired URL
// }
</script>
<%int c=1;%>
<%@include file="index1.html"%>
<div class="login-box">
    <img src="avatar.png" class="avatar">
        <h1>User Login</h1>
            <form action="stulogin.jsp">
            <p>Username</p>
            <input type="text" name="un" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="up" placeholder="Enter Password">
            <input type="submit" name="b1" value="Login">
			<font> New User??Register&nbsp<a href="regis.jsp">Here</a><br><br>
			<br>
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
			String q="select * from regis where username='"+s1+"'and password='"+s2+"'and verify='yes'";
			ResultSet rs=st.executeQuery(q);
			if(rs.next()){
				// Cookie ck=new Cookie("un",s1);
				// ck.setMaxAge(60*60);
				// response.addCookie(ck);
				// HttpSession session=request.getSession();
				session.setAttribute("c",c);
				session.setAttribute("un1",s1);
				response.sendRedirect("student.jsp");
			}
			else{
				%>
		<script type='text/javascript'>
		
		alert('invalid username or pass or not verified by ADMIN');
		window.location = 'stulogin.jsp';
		
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

