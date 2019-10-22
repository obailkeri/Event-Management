<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DataBaseConnection.GetConnection"%>
    <%@page import="com.mysql.jdbc.Connection"%>
  
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
   <%--  <%@page import="java.sql.Connection"%> --%>
    <%@page import="java.sql.*"%>
    
 

<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HTML to PDF </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="js/html2pdf.bundle.min.js"></script>

  <script>
    function generatePDF() {
      // Choose the element that our invoice is rendered in.
      const element = document.getElementById("invoice");
      // Choose the element and save the PDF for our user.
      html2pdf().from(element).save();

    }
  </script>
  <style>
    #invoice{
        float:left;
      }
    input{
      border:none;
    }
    .contents{
    
      float:left;
    }
    .pic{
    
      float:left;
    }
    #email{
      float:right;
    }
    #address{
	  float:left;
      margin-left: 8%;
      margin-top:9%;
    }
    #reason{
      margin-left: 11%;

    }
    #current{
      float:right;
    }
    #head{
      margin-top:10%; 
    }
    #coordinator{
      float:right;
      margin-right: 24%;
    }
   
  </style>
</head>
<body>
<% 

			response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate" );
		
			response.setHeader("Progma", "no-cahce");
			
			response.setHeader("Expires", "0");
			
			if(session.getAttribute("username") == null)
			{
				response.sendRedirect("Login.jsp");
			}
			%>
<button onclick="generatePDF()">Download as PDF</button>
  <div id="invoice">
    <div class="pic">
      <img src="img/Pict_logo.png" >
    </div>

    <div class="contents">
      <div style="text-align: center;">
        <h5>Society for Computer Technology and Research</h5>
        <h4>PUNE INSTITUTE OF COMPUTER TECHNOLOGY<br>
        (College of Engineering Affiliated to the University of Pune & Accredited by NBA)</h4></div>
        <h5>Sr.No.27, PUNE SATARA ROAD, DHANKAWADI, PUNE - 411043 (INDIA)<br><br>
        ID NO.: PU/PN/Engg./054 (1983)<br><br>
        ☎ (020) 24371101, 24378063 <div id="email">Fax No.: (020) 24372106/24364741</div><br><br>
        Website: https://pict.edu <div id="email">E-mail:principal@pict.edu</div> </h5>
        
    </div>
 	<br><br><br>
    <div id="address">
      To,<br><br>
      The Principal,<br><br>
      Pune Institute Of Computer Technology<br><br>
      Dhankawadi,Pune-411043.<br><br><br>

      Subject:-Your wish.<br><br><br>

      Respected Sir,
      
      <div id="reason">
         <%
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		
	
	try
	{
		System.out.println("Button value");
		System.out.println(request.getParameter("btn6"));
		String a=request.getParameter("btn6");
		int id=Integer.parseInt(a);
		//int id =(Integer)session.getAttribute("id");
		String sql="select o.name,u.name,e.event_name,e.start_date from event_ledger as e join users as u using(username) join organization as o using (org_id) where e.event_id=? ";
		con=(Connection) GetConnection.getConnection();
		
		
		st=con.prepareStatement(sql);
		st.setInt(1 ,id);
		rs=st.executeQuery();
		System.out.println("Id value");
		System.out.println(id);
		
		while(rs.next())
		{
		%>
		
        <br>
        We,the members of <%= rs.getString(1) %>,need permission to conduct a <br><br></div> <%= rs.getString(3) %> for students 
        on <%= rs.getDate(4) %>.<br><br>
        This session will be given by <%= rs.getString(2) %>,and will try to give beneficial tips to students.<br><br>
     
        Please grant us the permission for the same.<br><br>
        Thanking you 

      <div id="head">
      Name: <%= rs.getString(2) %> <br><br><br>
     
      </div>
    </div>
  </div>
  <%
	}
	}
catch (Exception e)
{

}
%>
 
  
 
</body>
</html>