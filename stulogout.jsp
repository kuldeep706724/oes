<script type="text/javascript">
sessionStorage.removeItem("m");sessionStorage.removeItem("s");
</script>
<%
Cookie ck=new Cookie("exam","");
ck.setMaxAge(0);
response.addCookie(ck);



session.invalidate();
response.sendRedirect("index.html");
%>