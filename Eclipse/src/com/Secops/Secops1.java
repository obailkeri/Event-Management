package com.Secops;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.util.Date;

import com.DataBaseConnection.GetConnection;

/**
 * Servlet implementation class Secops1
 */
@WebServlet("/Secops1")
public class Secops1 extends HttpServlet {
	private static final long serialVersidonUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Secops1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		System.out.print("Hello");
		
		String a=request.getParameter("btn2");
		Date date = new Date();
		int id=Integer.parseInt(a);
		
		Connection con=null;
        PreparedStatement st=null;
    	
		Connection con1=null;
        PreparedStatement st1=null;
       
       
        String sql="update slots_and_details set status_level=2 where event_id=?";
        String sql2="insert into security_acknowledgement values(?,?,?) ";
        con=(Connection) GetConnection.getConnection();
        st=con.prepareStatement(sql);
	  	st.setInt(1 ,id);
	  	st.execute();
	  	
	  	 con1=(Connection) GetConnection.getConnection();
	     st1=con1.prepareStatement(sql2);
		 st1.setInt(1 ,id);
		 st1.setTime(2 ,new Time(date.getTime()));
		 st1.setTime(3 ,new Time(date.getTime()));
		 st1.execute();
		  	
	  	
		}
		catch(Exception e)
		{
			
		}
		response.sendRedirect("DashBoard_sec.jsp");
		
	}

}
