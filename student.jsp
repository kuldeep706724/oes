<%
Cookie[] ckst=request.getCookies();
String ck=null;
if(ckst!=null){
	for(Cookie cookie:ckst){
		if(cookie.getName().equals("exam")){
			ck=cookie.getValue();
		}
	}
}
String sc=null;
sc=(String)session.getAttribute("un1");
if(sc==null|ck!=null){
	response.sendRedirect("stulogout.jsp");
}
else{
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="admin.css">
			<link rel="stylesheet" type="text/css" href="animate.css">

    </head>
    <body>
		   <div class="sidebar" style="background-image: url(downl.jpg)">
				<div class="sidebar-background" >
					<h2 class="animated infinite bounce" style="font-size: 23px;font-family: sans-serif;text-align: center;color: white;">
						Online Examination System
					</h2>
					<img src="oes.png" style="width: 42%;margin-left: 30%;">
					<div class="left-menu">
						<a href="stuprof.jsp"><h2>PROFILE</h2></a>
						<a href="exam.jsp"><h2>EXAM</h2></a>
						<a href="result.jsp"><h2>RESULT</h2></a>
		
					</div>
				</div>
			</div>
		   
		   
        
        <div class="data2">
            <center> <center><h2 class="animated infinite heartBeat">STUDENT PANEL</h2></center> <a href="stulogout.jsp" class="button" style="float: right;background:crimson;color:white;margin-right: 10px;">Logout</a>
			</center>   
		</div> 
		
	 </body>
    
    
</html>
<%}%>