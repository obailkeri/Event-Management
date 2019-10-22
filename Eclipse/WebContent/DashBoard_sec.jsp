<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DataBaseConnection.GetConnection"%>
    <%@page import="com.mysql.jdbc.Connection"%>
  
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
   <%--  <%@page import="java.sql.Connection"%> --%>
    <%@page import="java.sql.*"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Event Manager</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/logo.png">
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

    <!-----Nav-Bar--------------------------------------------------------------------------------------------->

    <header class="header">
      <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">

        <!-- LOGO img E top left corner -->
        <a href="index.html"><img src="img/logo.png" style="width:50px; height:40px;"></a>

        <!-- For Side Bar Toggle -->
        <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left ml-2"></i></a>

        <a href="index.html" class="navbar-brand font-weight-bold text-uppercase text-base mx-auto">Event Manager</a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
          <li class="nav-item dropdown mr-3"><a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1"><i class="fa fa-bell"></i><span class="notification-icon"></span></a>
            <div aria-labelledby="notifications" class="dropdown-menu"><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a><a href="#" class="dropdown-item"> 
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-green text-white"><i class="fas fa-envelope"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 6 new messages</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-blue text-white"><i class="fas fa-upload"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">Server rebooted</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item text-center"><small class="font-weight-bold headings-font-family text-uppercase">View all notifications</small></a>
            </div>
          </li>
          <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/user_icon.png" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
            <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family">${username}</strong><small></small></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item">Settings</a><a href="#" class="dropdown-item">Activity log       </a>
              <div class="dropdown-divider"></div><a href="Logout" class="dropdown-item">Logout</a>
            </div>
          </li>
        </ul>
      </nav>
    </header>

    <div class="d-flex align-items-stretch">

      <!-----Side-Bar--------------------------------------------------------------------------------------------->

      <div id="sidebar" class="sidebar py-3">
         <ul class="sidebar-menu list-unstyled">
              <li class="sidebar-list-item"><a href="DashBoard_sec.jsp" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <!-- <li class="sidebar-list-item"><a href="tables.html" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li> -->

          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages1" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted active"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Keys Records</span></a>
            <div id="pages1" class="collapse">
              <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                <li class="sidebar-list-item"><a href="key_given.jsp" class="sidebar-link text-muted pl-lg-5">Keys Given</a></li>
                <li class="sidebar-list-item"><a href="Secure_upcoming_events.jsp" class="sidebar-link text-muted pl-lg-5 active">Upcoming/Ongoing Events</a></li>
                <li class="sidebar-list-item"><a href="past_records.jsp" class="sidebar-link text-muted pl-lg-5">Past Records</a></li>
            </div>
          </li>

          <li class="sidebar-list-item"><a href="login.html" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>

      <!-----Center-Content--------------------------------------------------------------------------------------------->

      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <!-- My Events Summary Table -->

          <section class="py-5">
            <div class="row">
              <div class="col-lg-12 mb-4">
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-md-6">
                        <h6 class="text-uppercase mb-0">Keys Given</h6>
                      </div>
                      <div class="col-md-5 text-right">
                        <a href="key_given.jsp"><h6 class="text-uppercase mb-0">View All</h6></a>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <table class="table table-striped card-text">
                      <thead>
                        <tr>
                          <th class="text-center">#</th>
                          <th class="text-center">Sender Name</th>
                          <th class="text-center">Event Name</th>
                          <th class="text-center">Detail</th>
                         
                        </tr>
                      </thead>
                      <tbody>
                       <%
                      Connection con1=null;
                      PreparedStatement st1=null;
                      ResultSet rs1=null;
                      try
                      {
                    	  String sql="select distinct e.event_id,e.event_name,e.username,e.status_level,s.event_id,s.status_level from event_ledger e inner join slots_and_details s on e.event_id=s.event_id where e.status_level=5 and s.status_level=2 limit 5";
                    	  con1=(Connection) GetConnection.getConnection();
                    	  st1=con1.prepareStatement(sql);
                    	  rs1=st1.executeQuery();
                    	  
               			  while(rs1.next())
               			  {
               			  
                        %>
                        
                       		     <tr class="text-center">
		                          <th scope="row">  <c:set var="count4" value="${count4 + 1}" scope="page"/> ${count4} </th>
		                          <td class="text-center"><%= rs1.getString(3)  %></td>
		                          <td class="text-center"><%= rs1.getString(2)  %></td>
		             			<form action="key_given_detail.jsp" method =post>
		                         <td><button class="btn-sm btn-primary" value ="<%= rs1.getInt(1)  %>" name="btn">View</button></a></td>
		                         </form>
                          		
                       		 	</tr>
                       		 	    <% 	
		                  		}
		                  		
		                  	}
		                  	catch(Exception ex)
		                  	{
		                  		
		                  	}
                  	
                 	 %>
                          
                       
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="">
            <div class="row">
              <div class="col-lg-12 mb-4">
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-md-6">
                        <h6 class="text-uppercase mb-0">Upcoming Events</h6>
                      </div>
                      <div class="col-md-5 text-right">
                        <a href="Secure_upcoming_events.jsp"><h6 class="text-uppercase mb-0">View All</h6></a>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">                           
                    <table class="table table-striped card-text">
                      <thead>
                        <tr>
                          <th class="text-center">#</th>
                          <th class="text-center">Sender Name</th>
                          <th class="text-center">Event Name</th>
                          <th class="text-center">Permission</th>
                        </tr>
                      </thead>
                      <tbody>
                     <%
                      Connection con=null;
                      PreparedStatement st=null;
                      ResultSet rs=null;
                      try
                      {
                    	  String sql="select distinct e.event_id,e.event_name,e.username,s.event_id,s.status_level from event_ledger e inner join slots_and_details s on e.event_id=s.event_id where e.status_level=5 and s.status_level=1 limit 5";                	  
                    	  con=(Connection) GetConnection.getConnection();
                    	  st=con.prepareStatement(sql);
                    	  rs=st.executeQuery();
                    	  
               			  while(rs.next())
               			  {
               			  
                        %>
                        
                       		     <tr class="text-center">
		                          <th scope="row">  <c:set var="count3" value="${count3 + 1}" scope="page"/> ${count3} </th>
		                          <td class="text-center"><%= rs.getString(3)  %></td>
		                          <td class="text-center"><%= rs.getString(2)  %></td>
		             				<form action="upcoming_detail.jsp" method="post">
		             				<td><button class="btn-sm btn-primary" value ="<%= rs.getInt(1)%>" name="btn1" >View</button></td>
		             				</form>
                       		 	</tr>
                       		 	    <% 	
		                  		}
		                  		
		                  	}
		                  	catch(Exception ex)
		                  	{
		                  		
		                  	}
                  	
                 	 %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="py-3">
          </section>

          <section class="py-3">
          </section>

        </div>
        <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 text-center text-md-left text-primary">
                <p class="mb-2 mb-md-0">Mini Bois &copy; 2019</p>
              </div>
              <div class="col-md-6 text-center text-md-right text-gray-400">
                <p class="mb-0">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Mini Bois</a></p>
                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>

    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/charts-home.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>