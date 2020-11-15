<%@page import="java.sql.*"%>
<%
Cookie[] ck1=request.getCookies();
String s2=null;
if(ck1!=null){
	for(Cookie cookie:ck1){
		if(cookie.getName().equals("subject")){
			s2=cookie.getValue();
		}
	}
}

String sc=null;
sc=(String)session.getAttribute("un1");
if(sc==null|s2==null){
	response.sendRedirect("stulogout.jsp");
}
else{
Cookie ck=new Cookie("exam","exam");
ck.setMaxAge(60*60);
response.addCookie(ck);
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="exam1.css">
<style type="text/css">
#b233{
	position:fixed;
	margin-left: 48%;
    padding: 1%;
    margin-top: 6%;
    border-radius: 100px 10px 100px 10px;
    width: 12%;
    background-color: #200ede;
    color: #17e027;
    text-shadow: 0 0 11px black;
    font-weight: bold;
    font-size: 185%;
	border: none;
    outline: none;
    cursor: alias;
}
</style>
<script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
		// window.onbeforeunload = function() {
			// var confirmClose = confirm('Close?');
			// window.location='stulogout.jsp';
			// return confirmClose;
		// }
    </script>
</head>
<body>

<%! 
int c=0;
String selected[]; 
int j;
int a;
 // String subject="";
 int count;
 int min;
 int sec;
%>



<form action="exam1.jsp" method="post" name="quiz">
	
<%
	String subject="";
	Cookie[] ckk=request.getCookies();
	String subject1="";
	for(Cookie cookie:ckk){
		if(cookie.getName().equals("subject")){
			subject1=cookie.getValue();
		}	
	}
	subject=subject1;
	
	String s222="";
	if(ckk!=null){
		for(Cookie cookie:ckk){
			if(cookie.getName().equals("aa")){
			s222=cookie.getValue();
			a=Integer.parseInt(s222);
			}	
		}
	}
	
if(a==1){
	
	// HttpSession session1=request.getSession();
	// subject=(String)session.getAttribute("subject");
	c=(Integer)session.getAttribute("c");
	j=0;
	min=(Integer)session.getAttribute("min");
	sec=(Integer)session.getAttribute("sec");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q1="select count(*) from question where subject='"+subject+"'";
		ResultSet rs1=st.executeQuery(q1);
		rs1.next();
		count=Integer.parseInt(rs1.getString(1));
		session.setAttribute("count",count);
		
		selected=new String[count];
		con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	a++;
	s222="";
	Cookie cookieee=new Cookie("aa","");
	cookieee.setMaxAge(0);
	response.addCookie(cookieee);
}
%>

<%
String s1=request.getParameter("n");

if(s1!=null){
	c++;
	selected[j]=request.getParameter("a");
	j++;
}

String s22=request.getParameter("b");

if(s22!=null){
	c--;
	selected[j]=request.getParameter("a");
	j--;
}


String s33=request.getParameter("sub");

if(s33!=null){
	selected[j]=request.getParameter("a");
	
	for(int i=0;i<selected.length;i++){
	session.setAttribute("selected"+i,selected[i]);
	}
	c=1;
	selected=new String[count];
	j=0;
	
	Cookie cookiee=new Cookie("exam","");
	cookiee.setMaxAge(0);
	response.addCookie(cookiee);
	
	response.sendRedirect("result1.jsp");
}

String s44=request.getParameter("one");
if(s44!=null){
	c=Integer.parseInt(s44);
	selected[j]=request.getParameter("a");
	j=c-1;
}



try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
	
	Statement st=con.createStatement();
	
	String q="select * from question where Question_id='"+c+"' and subject='"+subject+"'";
	ResultSet rs=st.executeQuery(q);
	rs.next();
	%>
	
	
<div id="bdiv">
<%for(int i=1;i<=count;i++){%>
	<%if(c==i){%>  
	<input type="submit" value="<%=i%>" name="one" id="one" class="butt">
	<%}
	else if(selected[i-1]!=null){%>  
	<input type="submit" value="<%=i%>" name="one" id="two" class="butt">
	<%}
	else{%>  
	<input type="submit" value="<%=i%>" name="one" id="three" class="butt">
	<%}
}%>

</div>
	<div class="v11"></div>

<div id="Time"><font id="timer" >5:00</font></div>

<script type="text/javascript">	
if(sessionStorage.m )
	{
	}else{sessionStorage.m=<%=min%>;sessionStorage.s=<%=sec%>;}
document.getElementById("timer").innerHTML =sessionStorage.m+":"+sessionStorage.s;
startTimer();

function startTimer() 
{
  var time = document.getElementById('timer').innerHTML;
  var timeArray = time.split(":");
  var m = timeArray[0];
  var s = checkSecond((timeArray[1] - 1));
  
  if(s==59){m=m-1}
  sessionStorage.m=m;
  sessionStorage.s=s;
  document.getElementById('timer').innerHTML =sessionStorage.m+":"+sessionStorage.s;
  j=setTimeout(startTimer,1000);
  if(m==0 && s==0 | m<0)
  {		stop();
		document.getElementById("submit").click();
	}
}
function checkSecond(sec) {
  if (sec < 10 && sec >= 0) {sec = "0" + sec;}
  if (sec < 0) {sec = "59";}
  return sec;
}
function stop(){
	clearTimeout(j);
	sessionStorage.removeItem("m");sessionStorage.removeItem("s");
	return true;
}
</script>

<div id="question">
	
	<h2 id="quesno"><%=rs.getString(1)%> </h2>&nbsp&nbsp&nbsp

	<h2 id="ques"><%=rs.getString(2)%> </h2><br>
	
	
	<%
	
	if(selected[j]!=null){
	String k=selected[j];
	
	if(k.equals("1")){%>
		<input type="radio" name="a" id="option" value="1" checked="checked"><font class="opt"><%=rs.getString(3)%></font><br><br>
		<input type="radio" name="a" id="option" value="2"><font class="opt"><%=rs.getString(4)%></font><br><br>
		<input type="radio" name="a" id="option" value="3"><font class="opt"><%=rs.getString(5)%></font><br><br>
		<input type="radio" name="a" id="option" value="4"><font class="opt"><%=rs.getString(6)%></font><br><br>
	<%}
	else if(k.equals("2")){%>
		<input type="radio" name="a" id="option" value="1"><font class="opt"><%=rs.getString(3)%></font><br><br>
		<input type="radio" name="a" id="option" value="2" checked="checked"><font class="opt"><%=rs.getString(4)%></font><br><br>
		<input type="radio" name="a" id="option" value="3"><font class="opt"><%=rs.getString(5)%></font><br><br>
		<input type="radio" name="a" id="option" value="4"><font class="opt"><%=rs.getString(6)%></font><br><br>
	<%}
	else if(k.equals("3")){%>
		<input type="radio" name="a" id="option" value="1"><font class="opt"><%=rs.getString(3)%></font><br><br>
		<input type="radio" name="a" id="option" value="2"><font class="opt"><%=rs.getString(4)%></font><br><br>
		<input type="radio" name="a" id="option" value="3" checked="checked"><font class="opt"><%=rs.getString(5)%></font><br><br>
		<input type="radio" name="a" id="option" value="4"><font class="opt"><%=rs.getString(6)%></font><br><br>
	<%}
	else if(k.equals("4")){%>
		<input type="radio" name="a" id="option" value="1"><font class="opt"><%=rs.getString(3)%></font><br><br>
		<input type="radio" name="a" id="option" value="2"><font class="opt"><%=rs.getString(4)%></font><br><br>
		<input type="radio" name="a" id="option" value="3"><font class="opt"><%=rs.getString(5)%></font><br><br>
		<input type="radio" name="a" id="option" value="4" checked="checked"><font class="opt"><%=rs.getString(6)%></font><br><br>
	<%}
	}
	else{%>
		<input type="radio" name="a" id="option" value="1"><font class="opt"><%=rs.getString(3)%></font><br><br>
		<input type="radio" name="a" id="option" value="2"><font class="opt"><%=rs.getString(4)%></font><br><br>
		<input type="radio" name="a" id="option" value="3"><font class="opt"><%=rs.getString(5)%></font><br><br>
		<input type="radio" name="a" id="option" value="4"><font class="opt"><%=rs.getString(6)%></font><br><br>
	<%}%>
	
</div>
	
	<% if(c<count){%>
	<input type="submit" value="NEXT" name="n" id="b1">
	<%}%>
	<% if(c>1){%>
	<input type="submit" value="BACK" name="b" id="b233">
	<%}%>	
	<input type="submit" value="SUBMIT" name="sub" id="submit" onclick="return stop()">
	
	
	</form>
	<%
	con.close();
}catch(Exception e){
	out.println(e);
}
	if(s1!=null|s22!=null){
		response.sendRedirect("exam1.jsp");
	}
	%>
	
	
	
	</body>
	</html>
<%}%>