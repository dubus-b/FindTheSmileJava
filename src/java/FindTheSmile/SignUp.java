/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bdubus
 */
public class SignUp extends HttpServlet {
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher("/WEB-INF/inscription.jsp").forward( request, response );
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthdate = request.getParameter("birthdate");
        String mail = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("passwd");
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try {
                String dbusername = "root";
                String dbpassword = "root";
                Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/FindTheSmile", dbusername, dbpassword);
                Statement stmt = connection.createStatement();
                String tquery = "SELECT id FROM USAGERS";
                ResultSet r = stmt.executeQuery(tquery);
                int last_id = -1;
                while (r.next()) {
                    last_id = Integer.parseInt(r.getString("id"));
                }
                String query = "INSERT INTO USAGERS (NOM, PRENOM, DATEDENAISSANCE, TELEPHONNE,COURRIEL, MOTDEPASSE, ID) VALUES ('" + lastname + "', 'Armand','2010-04-02', '068067876', 'benjamin.dubus', 'password', " + (last_id + 1) + ")";
                stmt.executeUpdate(query);
                connection.close();
            } catch (SQLException ex) {
                System.err.println("Erreur de connexion: " + ex);
            }
        } catch (ClassNotFoundException cnfe) {
            System.err.println("Erreur de pilote: " + cnfe);
        }
       response.sendRedirect("/TP02-bdubus/accueil");  
    }
}
