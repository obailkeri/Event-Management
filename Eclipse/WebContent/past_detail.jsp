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

<style type="text/css">
  
* {
  margin: 0;
  padding: 0;
}

.seat {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 60px;
  height: 60px;
}

.seat1 {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 60px;
  height: 135px;
}

.seat2 {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 135px;
  height: 360px;
}

input:disabled {
  display: block;
  margin: 5px;
  background: #BDBDBD;
  border: 2px #9E9E9E solid;
  width: 100px;
  height: 110px;
}

.seat-select {
  display: none;
}

.seat-select:checked+.seat {
  background: #536DFE;
}

.seat-select:checked+.seat1 {
  background: #536DFE;
}

.seat-select:checked+.seat2 {
  background: #536DFE;
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
                <li class="sidebar-list-item"><a href="Secure_upcoming_events.jsp" class="sidebar-link text-muted pl-lg-5">Upcoming/Ongoing Events</a></li>
                <li class="sidebar-list-item"><a href="past_records.jsp" class="sidebar-link text-muted pl-lg-5 active">Past Records</a></li>
            </div>
          </li>
              <li class="sidebar-list-item"><a href="Login.jsp" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>

      <!-----Center-Content--------------------------------------------------------------------------------------------->
		<%
      Connection con=null;
      PreparedStatement st=null;
      ResultSet rs=null;
      try
      {
    	  
    	  String a=request.getParameter("btn1");
  		  int id=Integer.parseInt(a);
    	  String sql="select distinct e.event_id,e.event_name,e.username,e.status_level,e.description,e.start_date,e.end_date,s.event_id,s.status_level from event_ledger e inner join slots_and_details s on e.event_id=s.event_id where e.status_level=6 and s.status_level=3 and e.event_id=?";
    	  con=(Connection) GetConnection.getConnection();
    	  st=con.prepareStatement(sql);
    	  st.setInt(1 ,id);
    	  rs=st.executeQuery();
    	  
		  while(rs.next())
		  {
      %>
      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <section class="py-5">
            <div class="row">
              <div class="col-lg-12 mb-4">

                <div class="card">
                  <div class="card-header">
                    <h3 class="h6 text-uppercase mb-0">Event Name:<%=rs.getString(2) %></h3>
                  </div>

                  <div class="card-body">
                    <h5><span>Approved/Rejected</span> By</h5>
                    <br>
                    <p>Head Organiser:<%=rs.getString(3) %></p>
                    <p>Event Description:<%=rs.getString(5) %></p>
                    <p>Start Date:<%= rs.getDate(6) %></p>
                    <p>End Date:<%= rs.getDate(7) %></p>
                    <br>
                  </div>
                </div>
				<%
				 }
				  	}
				  catch (Exception e)
				  {
				
				  }
			  %>
                <section class="py-2"></section>

                <div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0">Classroom Approved</h6>
                  </div>
                  <div class="card-body">
                    <form id="room_book" method="" action="">
                      <!-- Floor Selection -->
                      <!-- <div class="form-group row justify-content-center">
                        <label class="col-md-2 form-control-label"><p class="pt-1" style="font-size: 20px;">Select Floor :</p></label>
                        <div class="col-md-3 select mb-3 pl-0">
                          <select name="account" class="form-control">
                            <option>Ground</option>
                            <option>First</option>
                            <option>Second</option>
                            <option>Third</option>
                            <option>Fourth</option>
                          </select>
                        </div>
                      </div> -->

                      <!-- <div class="form-group row justify-content-center">
                        <label class="col-md-12 form-control-label text-center"><p class="pt-1" style="font-size: 20px;">Please Accept or Reject all Proposed Classrooms</p></label>
                      </div> -->

                      <div class="row justify-content-center pb-5">
                        <div class="col-md-4">
                          <section id="seats">
                            <table>
                              <!-- Row 1 -->
                              <tr>
                                <td>
                                  <input id="seat-1" class="seat-select" type="checkbox" value="1" name="seat[]" >
                                  <label for="seat-1" class="seat" data-toggle="popover" data-content="001"></label>
                                </td>
                                <td>
                                  <input id="seat-2" class="seat-select" type="checkbox" value="2" name="seat[]">
                                  <label for="seat-2" class="seat" data-toggle="popover" data-content="002"></label>
                                </td>
                                <td colspan="2" rowspan="5">
                                  <input id="seat-3" class="seat-select" type="checkbox" value="3" name="seat[]">
                                  <label for="seat-3" class="seat2" data-toggle="popover" data-content="BasketBall Ground"></label>
                                </td>
                              </tr>
                              <!-- Row 2 -->
                              <tr>
                                <td>
                                  <input id="seat-4" class="seat-select" type="checkbox" value="4" name="seat[]">
                                  <label for="seat-4" class="seat" data-toggle="popover" data-content="003"></label>
                                </td>
                                <td rowspan="2">
                                  <input id="seat-5" class="seat-select" type="checkbox" value="5" name="seat[]">
                                  <label for="seat-5" class="seat1" data-toggle="popover" data-content="Seminar Hall 1"></label>
                                </td>
                              </tr>
                              <!-- Row 3 -->
                              <tr>
                                <td>
                                  <input id="seat-6" class="seat-select" type="checkbox" value="6" name="seat[]" >
                                  <label for="seat-6" class="seat" data-toggle="popover" data-content="004"></label>
                                </td>
                              </tr>
                              <!-- Row 4 -->
                              <tr>
                                <td>
                                  <input id="seat-7" class="seat-select" type="checkbox" value="7" name="seat[]">
                                  <label for="seat-7" class="seat" data-toggle="popover" data-content="005"></label>
                                </td>
                                <td rowspan="2">
                                  <input id="seat-8" class="seat-select" type="checkbox" value="8" name="seat[]">
                                  <label for="seat-8" class="seat1" data-toggle="popover" data-content="Seminar Hall 2"></label>
                                </td>
                              </tr>
                              <!-- Row 5 -->
                              <tr>
                                <td>
                                  <input id="seat-9" class="seat-select" type="checkbox" value="9" name="seat[]">
                                  <label for="seat-9" class="seat" data-toggle="popover" data-content="006"></label>
                                </td>
                              </tr>
                            </table>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h4 id="exampleModalLabel" class="modal-title">Room Number</h4>
                                  <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                                  </div>
                                  <div class="modal-body">
                                  <p>Title :</p>
                                  <p>Description</p>
                                  <p>Time Slot</p>

                                </div>
                                </div>
                              </div>
                            </div>

                          </section>
                        </div>
                      </div>
					<%
					try
					{
					String a=request.getParameter("btn1");
			  		int id=Integer.parseInt(a);
					Connection con2=null;
			        PreparedStatement st2=null;
			        ResultSet rs2=null;
 					String sql3="select distinct in_time,out_time from security_acknowledgement where event_id =?";
				  	con2=(Connection) GetConnection.getConnection();
				    st2=con2.prepareStatement(sql3);
					st2.setInt(1 ,id);
					rs2=st2.executeQuery();
					while(rs2.next())
					{
					%>
                      <div class="row justify-content-start">
                        <div class="col-lg-5 col-md-6">
                          <div><h5>Key Given on  : </h5><span><%=rs2.getTime(1) %></span></div>
                          <br>
                          <div><h5>Taken Back on  : </h5><span><%=rs2.getTime(2) %></span></div>
                        </div>
                      </div>
                      	<%
				 }
				  	}
				  catch (Exception e)
				  {
				
				  }
			  %>
                    </form>
	 
                  </div>
                </div>

              </div>
            </div>
          </section>

        </div>

        <!-----Footer--------------------------------------------------------------------------------------------->

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
    <script src="js/front.js"></script>

    <%
		Connection con3=null;
		ResultSet rs3=null;
		PreparedStatement st3=null;
		try
		{
		String a=request.getParameter("btn1");
		int id2=Integer.parseInt(a);
		String sql3="select * from slots_and_details where event_id=?";
		con3 = (Connection) GetConnection.getConnection();
		st3 = con3.prepareStatement(sql3);
		st3.setInt(1,id2);
		rs3=st3.executeQuery();
		
		%>
    <script type="text/javascript">
      
    $(document).ready(function(){
        $('[data-toggle="popover"]').popover({
            placement : 'top',
            trigger : 'hover'
        });
        <% while(rs3.next()) {%>
        
        $('tr input[type=checkbox]').filter(function(){
 		   return this.value === "<%= rs3.getInt(2)  %>" ;
 		}).prop('checked', true);
        <%}%>
        
        
        $('input[type="checkbox"]').on('change', function(e){
          if(!e.target.checked){
            
            e.target.checked = true;
          }
          else {
            e.target.checked = false;
          }
        });
		
        $("#refresh").click(function () { 
          location.reload(true); 
        }); 
      });

    </script>
    <%
    }
		catch(Exception e)
		{
			
		}%>
  </body>
</html>