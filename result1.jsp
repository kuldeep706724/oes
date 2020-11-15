<%@page import="java.sql.*"%>

	
	
	
	<%
	int marks=0;
	int correct=0;
	int wrong=0;
	String selected[]; 
	String answer[]; 
	String subject="";
	int a=1;
	int count=0; 
	int count1; 
	float Tot_marks; 
	String un="";
	String result="";
	
	// HttpSession session1=request.getSession();
	// session1.invalidate();
	Cookie[] ck1=request.getCookies();
	for(Cookie cookie:ck1){
		if(cookie.getName().equals("subject")){
			subject=cookie.getValue();
		}
	}
	
	
		// subject=(String)session.getAttribute("subject");
		un=(String)session.getAttribute("un1");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kuldeepdb?useSSL=false&allowPublicKeyRetrieval=true","root","root");
		
		Statement st=con.createStatement();
		
		String q4="select count(*) from question where subject='"+subject+"'";
		ResultSet rs4=st.executeQuery(q4);
		rs4.next();
		count=Integer.parseInt(rs4.getString(1));
		
		selected=new String[count];
		answer=new String[count];
	
	
	for(int i=0;i<selected.length;i++){
	selected[i]=(String)session.getAttribute("selected"+i);
	}
	
		String q1="select * from question where subject='"+subject+"'";
		ResultSet rs1=st.executeQuery(q1);
		
		for(int i=0;i<answer.length;i++){
			rs1.next();
			answer[i]=rs1.getString(7);
		}
		
		
		for(int i=0;i<answer.length;i++){
			if(answer[i].equals(selected[i])){
				marks=marks+2;
				correct=correct+1;
				wrong=wrong+0;
			}
			else{
				marks=marks+0;
				wrong=wrong+1;
				correct=correct+0;
			}
		}
		
		out.println("marks "+marks);		
		out.println("correct "+correct);		
		out.println("wrong "+wrong);		
		
		String q2="select count(*) from question where subject='"+subject+"'";
		ResultSet rs2=st.executeQuery(q2);
		rs2.next();
		count1=Integer.parseInt(rs2.getString(1));
		Tot_marks=count1*2;
		
		float res=(33f/100f)*Tot_marks;
		if(marks>res){
			result="pass";
		}
		else{
			result="fail";
		}
		
		String q3="insert into result values('"+un+"','"+(int)Tot_marks+"','"+marks+"','"+correct+"','"+wrong+"','"+result+"','"+subject+"')";
		st.executeUpdate(q3);
		a++;
		con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		marks=0;
		correct=0;
		wrong=0;
		count=0;
		count1=0;
		
		Cookie cookiee=new Cookie("subject","");
		cookiee.setMaxAge(0);
		response.addCookie(cookiee);
		
		response.sendRedirect("result.jsp");
	%>