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
        <link rel="stylesheet" type="text/css" href="admin.css">
    </head>
    <body>
   <%@include file="mymenu.jsp"%> 
    
		
     
    </body>
    
    
</html>
<%}%>