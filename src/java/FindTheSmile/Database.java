/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author bdubus
 */
public class Database {
    public Boolean MailIsTaken;
    public String dbusername = "root";
    public String dbpassword = "root";
    public String jdbcPath = "jdbc:derby://localhost:1527/FindTheSmile";
    
    public Database() {
    MailIsTaken = false;
    }
    public int SignUp(FindTheSmile.Users newUser) throws SQLException
    {
        try (Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/FindTheSmile", dbusername, dbpassword)) {
            Statement stmt = connection.createStatement();
            String tquery = "SELECT id FROM USAGERS";
            ResultSet r = stmt.executeQuery(tquery);
            int last_id = -1;
            while (r.next()) {
                last_id = Integer.parseInt(r.getString("id"));
            }
            String query = "INSERT INTO USAGERS (NOM, PRENOM, DATEDENAISSANCE, TELEPHONNE,COURRIEL, MOTDEPASSE,DERNIERSCORE, MEILLEURSCORE, ID) VALUES ('" + newUser.getSurname() + "', '" + newUser.getName() +
                    "','"+ newUser.getBirstDate() + "', '" + newUser.getPhoneNumber()+ "', '" + newUser.getEmail() + "', '"+ newUser.getPassword() +"',0,0," + (last_id + 1) + ")";
            
            int result = stmt.executeUpdate(query);
            return result;
        }
    }
    public Boolean MailIsTaken(String email) throws SQLException
    {
        
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/FindTheSmile", dbusername, dbpassword);
        Statement stmt = connection.createStatement();
        String query = "SELECT courriel FROM USAGERS WHERE COURRIEL = '" + email + "'";
        ResultSet r;
        r = stmt.executeQuery(query);
        return r.next();            
    }
}