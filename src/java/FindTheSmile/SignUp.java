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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        String sbirthdate = request.getParameter("birthdate");
        String mail = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("passwd");
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try {
                Users User = new Users(firstname, lastname, sbirthdate, phone, mail, password, 0, 0);
                Database dbaction = new Database();
                int result = dbaction.SignUp(User);
            } catch (SQLException ex) {
                System.err.println("Erreur de connexion: " + ex);
            }
        } catch (ClassNotFoundException cnfe) {
            System.err.println("Erreur de pilote: " + cnfe);
        }
       response.sendRedirect("/TP02-bdubus/accueil");  
    }
}
