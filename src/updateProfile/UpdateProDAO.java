package updateProfile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateProDAO {
	
	private Connection connection;
    private Statement statement;

 public UpdateProDAO() { }
 
 public UpdatePro getUpdatePro(int Id) throws SQLException {
     String query = "SELECT * FROM profile WHERE fk_user=" + Id;
     ResultSet rs = null;
     UpdatePro updatePro = null;
     try {
         connection = ConnectionFactory.getConnection();
         statement = connection.createStatement();
         rs = statement.executeQuery(query);
         if (rs.next()) {
        	 updatePro = new UpdatePro();
        	 updatePro.setId(rs.getInt("profile_id"));
        	 updatePro.setFullname(rs.getString("fullname"));
        	 updatePro.setSurname(rs.getString("surname"));
        	 updatePro.setSex(rs.getInt("sex"));
        	 updatePro.setWeight(rs.getFloat("weight"));
        	 updatePro.setBmi(rs.getFloat("bmi"));
        	 updatePro.setAge(rs.getInt("age"));
        	 updatePro.setIffp(rs.getInt("iffp"));
        	 updatePro.setBp(rs.getInt("bp"));
        	 updatePro.setDpf(rs.getFloat("dpf"));
        	 updatePro.setSugar(rs.getFloat("sugar"));
        	 updatePro.setFk_user(rs.getInt("fk_user"));
         }
     } finally {
         DbUtil.close(rs);
         DbUtil.close(statement);
         DbUtil.close(connection);
     }
     return updatePro;
}
}
