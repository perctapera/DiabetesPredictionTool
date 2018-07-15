package profile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet(name = "InsertData", urlPatterns = { "/InsertData" })
public class InsertingData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Logger logger = Logger.getLogger(ProfileServlet.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String surname = request.getParameter("surname");
		String gender = request.getParameter("gender");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");
		String bmi = request.getParameter("bmi");
		String age = request.getParameter("age");
		String notp = request.getParameter("notp");
		String bp = request.getParameter("bp");
		String dpf = request.getParameter("dpf");
		String sugar = request.getParameter("sugar");
		String errorMsg = null;
		
		if(fullname == null || fullname.equals("")){
			errorMsg = "Fullname can't be null or empty.";
		}
		if(surname == null || surname.equals("")){
			errorMsg = "Password can't be null or empty.";
		}
		
		if(errorMsg != null){
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.html");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>"+errorMsg+"</font>");
			rd.include(request, response);
		}
		else{
		
		Connection con = (Connection) getServletContext().getAttribute("DBConnection");
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement("insert into profile(fullname, surname, sex, weight, bmi, age, iffp, bp, dpf, sugar) values (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fullname);
			ps.setString(2, surname);
			ps.setString(3, gender);
			ps.setString(4, weight);
			ps.setString(5, bmi);
			ps.setString(6, age);
			ps.setString(7, notp);
			ps.setString(8, bp);
			ps.setString(9, dpf);
			ps.setString(10, sugar);
			
			ps.execute();	
		
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile.html");
			PrintWriter out= response.getWriter();
			out.println("<font color=green>Profile updated successfully.</font>");
			rd.include(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("DB Connection problem.");
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}

}
}