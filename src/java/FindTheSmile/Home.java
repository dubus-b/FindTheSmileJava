/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bdubus
 */
public class Home extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward( request, response );
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Database dbAction = new Database();
        Boolean userIsValid;
        try {
                        System.out.println(email + password);

            userIsValid = dbAction.prepareLogin(email, password);
            
        } catch (SQLException ex) {
            userIsValid = false;
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session;
        if(userIsValid)
        {
            PrintWriter out = response.getWriter();
            session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("/TP02-bdubus/jeu");  
        }
        else
        {
            String erreur = "Le mot de passe et/ou l'addresse de courriel est incorect.";
            request.setAttribute("erreur", erreur);
            this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward( request, response );
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
