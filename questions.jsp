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
        <link rel="stylesheet" type="text/css" href="questions.css">
		<script type="text/javascript">
		function demo(){
			if(ques()&inpop1()&inpop2()&inpop3()&inpop4()){
				return true;
			}
			else{
				return false;
			}
		}
		function ques(){
			a=document.getElementById("inpques").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("que").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		function inpop1(){
			a=document.getElementById("inpopa").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("que").innerHTML="*All fields are mandatory ";
				return false;
			}
		}
		function inpop2(){
			a=document.getElementById("inpopb").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("que").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		function inpop3(){
			a=document.getElementById("inpopc").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("que").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		function inpop4(){
			a=document.getElementById("inpopd").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("que").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		</script>
    </head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="questions.jsp" method="post">
	<div class="title">Show Questions For</div>
        <div id="data3">
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			
			String q="select * from courses";
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
		
		
		
		
		
		
		
		
		
		
		<div class="title1">Add New Question</div>
        <div id="data4">
		<table cellpadding="15px">
		<tr><br><br>
		<td> Course Name:</td>
		<td>
		<%
		String q1="select * from courses";
			ResultSet rs1=st.executeQuery(q1);
			
		%>
			<select style="text-align:center;" id="sub" name="n2"> 
			<%while(rs1.next()){%>
			<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%> </option>
			<%}%>
			</td>
		</tr>
		<%	
		con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		
		%>
		<span id="que" style="color:red;font-weight: bold;margin-left: 42%;"></span>
		<tr>
		<td> Question:</td>
		<td><input type="text"  id="inpques" name="ques"> </td>
		</tr>
		
		<tr>
		<td> Option A:</td>
		<td><input type="text" id="inpopa" name="opta"> </td>
		<td> Option B:</td>
		<td><input type="text" id="inpopb" name="optb"> </td>
		</tr>
		<tr>
		<td> Option C:</td>
		<td><input type="text" id="inpopc" name="optc"> </td>
		<td> Option D:</td>
		<td><input type="text" id="inpopd" name="optd"> </td>
		</tr>
		
		<tr>
		<td> Correct Option:</td>
		<td><select style="text-align:center;" name="ans" id="ans"> 
			<option value="1">A</option>
			<option value="2">B</option>
			<option value="3">C</option>
			<option value="4">D</option>
			
		</td>
		</tr>
		</table>
		<input type="submit" value="ADD" name="add" id="add" onclick="return demo()" >
		</form>
        </div>
		
		
		
		
	</form>
	</body>
</html>
<%
String s1=request.getParameter("show");
if(s1!=null){
	String course=request.getParameter("n1");
	session.setAttribute("course",course);
	
	response.sendRedirect("show.jsp");
}

String s2=request.getParameter("add");
if(s2!=null){
	int count=0;
	String qid=null;
	
	String course_name=request.getParameter("n2");
	String ques=request.getParameter("ques");
	String opta=request.getParameter("opta");
	String optb=request.getParameter("optb");
	String optc=request.getParameter("optc");
	String optd=request.getParameter("optd");
	String ans=request.getParameter("ans");	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="select count(*) from question where subject='"+course_name+"'";
		ResultSet rs=st.executeQuery(q);
		
		rs.next();
		
		count=Integer.parseInt(rs.getString(1));
		count++;
		qid=Integer.toString(count);
		
		String q1="insert into question values('"+qid+"','"+ques+"','"+opta+"','"+optb+"','"+optc+"','"+optd+"','"+ans+"','"+course_name+"')";
		st.executeUpdate(q1);
		
		
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}






}
%>
