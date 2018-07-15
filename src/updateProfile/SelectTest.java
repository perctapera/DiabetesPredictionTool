package updateProfile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import login.User;

public class SelectTest extends HttpServlet {

//	 public static void main(String[] args) {
//	
//	 getUpdatePro();
//	 }
	private void getUpdatePro(HttpServletRequest request) {
		Connection con = (Connection) getServletContext().getAttribute("DBConnection");
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("User");
			
			int id = user.getId();

			UpdateProDAO empDao = new UpdateProDAO();
			UpdatePro updatePro = empDao.getUpdatePro(id);

			if (updatePro != null) {

				System.out.println("Profile ID:" + updatePro.getId());
				System.out.println("Fullname:" + updatePro.getFullname());
				System.out.println("Surname:" + updatePro.getSurname());
				System.out.println("Sex:" + updatePro.getSex());
				System.out.println("Weight:" + updatePro.getWeight());
				System.out.println("BMI:" + updatePro.getBmi());
				System.out.println("Age:" + updatePro.getAge());
				System.out.println("Iffp:" + updatePro.getIffp());
				System.out.println("Bp:" + updatePro.getBp());
				System.out.println("dpf:" + updatePro.getDpf());
				System.out.println("Sugar:" + updatePro.getSugar());
				System.out.println("User_id:" + updatePro.getFk_user());
				System.out.println();

			} else {
//				System.out.println("No Profile with Id: " + Id);
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}