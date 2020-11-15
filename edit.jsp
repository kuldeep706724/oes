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
        <link rel="stylesheet" type="text/css" href="edit.css">
		<script type="text/javascript">
		function demo(){
			if(qid()){
				return true;
			}
			else{
				return false;
			}
		}
		function qid(){
			a=document.getElementById("qid").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("qidd").innerHTML="*This field is mandatory";
				return false;
			}
		}
		
		// Question
		
		function demoo(){
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
		
		//course
		
		function demo1(){
			if(mins()&secs()){
				return true;
			}
			else{
				return false;
			}
		}
		
		function mins(){
			a=document.getElementById("min").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("c1").innerHTML="*All fields are mandatory ";
				return false;
			}
		}
		function secs(){
			a=document.getElementById("sec").value;
			if(a.length>=1){
				return true;
			}
			else{
				document.getElementById("c1").innerHTML="*All fields are mandatory";
				return false;
			}
		}
		</script>
			
		
		</script>
		</head>
	<body>
	
	<%@include file="mymenu.jsp"%>
		<form action="edit.jsp" method="post">
	<div class="title">Edit For</div>
        <div id="data3">
		<%!
		String qid="";
		String subj="";
		%>
		
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
			
			Statement st=con.createStatement();
			
			String q="select * from courses";
			ResultSet rs=st.executeQuery(q);
			
		%>
		<center>
		
		<span id="c1" style="color:red;margin-left:39%;"></span>
		
		<table cellpadding="12px" id="table" border="12" style="box-shadow: 0 0 19px 1px black;">
		<tr><br><br>
		<td id="abc">Course</td>
		<td id="def"><select id="data31" style="text-align:center;" name="n1">
		<%while(rs.next()){%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%> </option>
		<%}%>
		</select> </td>
		</tr>
		<tr>
		<th colspan="2" style="color:white;font-size:20px;">TIME</th>
		</tr>
		<tr>
		<td id="abc">Mins:</td>
		<td id="def"><input type="text" name="mins" id="min"> </td>
		<span id="c2" style="color:red;"></span>
		</tr>
		<tr>
		<td id="abc">Secs:</td>
		<td id="def"><input type="text" name="secs" id="sec"> </td>
		<span id="c3" style="color:red;"></span>
		</tr>
		<tr>
		<th colspan="2"><input type="submit" value="DONE" name="upd" onclick="return demo1()" id="button"> </td>
		</tr>
		</center>
		
		</table>   
        </div>
		
		
		
		
		
		<div class="title1">Edit Question</div>
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
			<option>-----</option>
			<%while(rs1.next()){%>
			<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%> </option>
			<%}%>
			</td>
		<td>Question Id:</td>
		<td>
		<input type="text" id="qid" name="qid">
		<span id="qidd" style="color:red;"></span>
		</td>
		
		<td>
		<input type="submit" value="FETCH" id="fetch" name="fetch">
		</td>
		<%	
		String s2=request.getParameter("fetch");
		
		if(s2!=null){
			qid=request.getParameter("qid");
			subj=request.getParameter("n2");
			
			String q2="select * from question where Question_id='"+qid+"' and subject='"+subj+"'";
			ResultSet rs2=st.executeQuery(q2);
			if(rs2.next()){
		%>
		</tr>
		
		<span id="que" style="color:red;font-weight: bold;margin-left: 42%;"></span>
		<tr>
		<td> Question:</td>
		<td><input type="text" value="<%=rs2.getString(2)%>" id="inpques" name="ques"> </td>
		</tr>
		
		<tr>
		<td> Option A:</td>
		<td><input type="text" value="<%=rs2.getString(3)%>" id="inpopa" name="opta"> </td>
		<td> Option B:</td>
		<td><input type="text" value="<%=rs2.getString(4)%>" id="inpopb" name="optb"> </td>
		</tr>
		<tr>
		<td> Option C:</td>
		<td><input type="text" value="<%=rs2.getString(5)%>" id="inpopc" name="optc"> </td>
		<td> Option D:</td>
		<td><input type="text" value="<%=rs2.getString(6)%>" id="inpopd" name="optd"> </td>
		</tr>
		
		<tr>
		<td> Correct Option:</td>
		<td><select style="text-align:center;" name="ans" id="ans" > 
			<option value="1">A</option>
			<option value="2">B</option>
			<option value="3">C</option>
			<option value="4">D</option>
			
		</td>
		</tr>
		</table>
		<input type="submit" value="UPDATE" name="add" id="add" onclick="return demoo()" style="position:fixed;">
		</form>
        </div>
		<%
			}
		}
		con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		
		%>
	</body>
</html>
<%
String s1=request.getParameter("upd");
if(s1!=null){
	
	String course=request.getParameter("n1");
	String mins=request.getParameter("mins");
	String secs=request.getParameter("secs");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q="update courses set min='"+mins+"',sec='"+secs+"' where course_name='"+course+"'";
		st.executeUpdate(q);
		response.sendRedirect("courses.jsp");
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}

String s3=request.getParameter("add");
if(s3!=null){
	
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
		
		String q="update question set question='"+ques+"',option1='"+opta+"',option2='"+optb+"',option3='"+optc+"',option4='"+optd+"',correct_option='"+ans+"' where Question_id='"+qid+"' and subject='"+subj+"'";
		st.executeUpdate(q);
		%>
		<script type="text/javascript">
		alert("update success");
		window.location="edit.jsp";
		</script>
		<%
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	
}

}
%>



