package com.Secops;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DataBaseConnection.GetConnection;
import java.sql.Time;
import java.util.Date;

/**
 * Servlet implementation class Secops2
 */
@WebServlet("/Secops2")
public class Secops2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Secops2() {
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
			
			int id=Integer.parseInt(a);
			
			Connection con=null;
	        PreparedStatement st=null;
	        Connection con1=null;
	        PreparedStatement st1=null;
	        Connection con2=null;
	        PreparedStatement st2=null;
	       
	        String sql="update slots_and_details set status_level=3 where event_id=?";
	        String sql2="update event_ledger set status_level=6 where event_id=?";
	        con=(Connection) GetConnection.getConnection();
	        st=con.prepareStatement(sql);
	        con1=(Connection) GetConnection.getConnection();
	        st1=con1.prepareStatement(sql2);
		  	st.setInt(1 ,id);
		  	st.execute();
		  	st1.setInt(1 ,id);
		  	st1.execute();
		  	Date date = new Date();
		  	String sql3="update security_acknowledgement set out_time=? where event_id =?";
		  	con2=(Connection) GetConnection.getConnection();
		    st2=con2.prepareStatement(sql3);
			st2.setInt(2 ,id);
			st2.setTime(1 ,new Time(date.getTime()));
			
			st2.execute();
			  	
			}
			catch(Exception e)
			{
				
			}
			response.sendRedirect("DashBoard_sec.jsp");
			
		}
	}


