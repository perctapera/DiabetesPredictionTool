package profile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import login.User;

@WebServlet(name = "UpdateData", urlPatterns = { "/UpdateData" })
public class dbUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Logger logger = Logger.getLogger(ProfileServlet.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String surname = request.getParameter("surname");
		String gender = request.getParameter("gender");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");
		String age = request.getParameter("age");
		String notp = request.getParameter("notp");
		String bp = request.getParameter("bp");
		String dpf = request.getParameter("dpf");
		//String sugar = request.getParameter("sugar");
		String vision = request.getParameter("vision");
		String urine = request.getParameter("urine");
		String thirsty = request.getParameter("thirsty");
		String hungry = request.getParameter("hungry");
		String tiredness = request.getParameter("tiredness");
		String errorMsg = null;
		
		int visionn = Integer.parseInt(vision);
		int urinee = Integer.parseInt(urine);
		int thirstyy = Integer.parseInt(thirsty);
		int hungryy = Integer.parseInt(hungry);
		int tirednesss = Integer.parseInt(tiredness);
		
		

		
		HttpSession session = request.getSession();
		

		float w = Float.parseFloat(weight);
		float h = Float.parseFloat(height);
		float hM = h/100;
		float bmi = w/(hM*hM);


		Random rand = new Random(); 
		int value = rand.nextInt(50); 

		float sugar = 0;
		sugar = (value/100);

User user = (User) session.getAttribute("User");
 
 int user_id =user.getId();

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
			//ps = con.prepareStatement("insert into profile (fullname, surname, sex, weight, bmi, age, iffp, bp, dpf, sugar) values (?,?,?,?,?,?,?,?,?,?)");
			
			
			ps = con.prepareStatement("UPDATE profile SET fullname = ?, surname = ?, sex = ?, weight = ?, bmi = ?, age = ?, iffp = ?, bp = ?, dpf = ?, sugar = ?, height = ? WHERE fk_user = ?") ;
			
			ps.setString(1, fullname);
			ps.setString(2, surname);
			ps.setInt(3, Integer.parseInt(gender));
			ps.setFloat(4, Float.parseFloat(weight));
			ps.setFloat(5, bmi);
			ps.setInt(6, Integer.parseInt(age));
			ps.setInt(7, Integer.parseInt(notp));
			ps.setInt(8, Integer.parseInt(bp));
			ps.setFloat(9, Float.parseFloat(dpf));
			ps.setFloat(10,(sugar));
			ps.setInt(11, Integer.parseInt(height));
			ps.setInt(12, user_id);
			
			ps.execute();	
		
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=green>Profile updated successfully.</font>");
			rd.include(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
//			throw new ServletException("DB Connection problem.");
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}

}
}