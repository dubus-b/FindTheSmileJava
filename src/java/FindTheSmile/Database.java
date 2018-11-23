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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        
        Connection connection = DriverManager.getConnection(jdbcPath, dbusername, dbpassword);
        Statement stmt = connection.createStatement();
        String query = "SELECT courriel FROM USAGERS WHERE COURRIEL = '" + email + "'";
        ResultSet r;
        r = stmt.executeQuery(query);
        MailIsTaken = r.next();
        connection.close();
        return MailIsTaken;            
    }
    
    public Boolean prepareLogin(String email, String password) throws SQLException
    {
        Connection connection = DriverManager.getConnection(jdbcPath, dbusername,dbpassword);
        Statement stmt = connection.createStatement();
        ResultSet r;
        String query = "SELECT id FROM USAGERS WHERE COURRIEL = '" + email + "' AND MOTDEPASSE = '" + password + "'" ;
        r = stmt.executeQuery(query);
        boolean userIsValid = r.next();
        connection.close();
        return userIsValid;
    }
    public Users getUserByEmail(String email) throws SQLException
    {
        Connection connection = DriverManager.getConnection(jdbcPath, dbusername, dbpassword);
        Statement stmt = connection.createStatement();
        ResultSet r;
        String query = "SELECT courriel FROM USAGERS WHERE COURRIEL = '" + email + "'";
        r = stmt.executeQuery(query);
        if (r.next() == false)
            return null;
        else
        {
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            Date date = r.getDate("DATEDENAISSANCE");
            String DateString = df.format(date);
            return new Users(r.getString("NOM"), r.getString("PRENOM"),DateString, 
                    r.getString("TELEPHONNE"), r.getString("COURRIEL"), 
                    r.getString("MOTDEPASSE"), r.getInt("DERNIERSCORE"), 
                    r.getInt("MEILLEURSCORE"));
        }
    }
}
