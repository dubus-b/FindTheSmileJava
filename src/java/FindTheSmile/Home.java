/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

import java.io.IOException;
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
        HttpSession session = request.getSession(false);
        if (session != null){
            Users user = (Users) session.getAttribute("User");
            
            if (user == null)
                session.invalidate();
            else
            {
                Database database = new Database();
            try {
                user = database.getUserByEmail(user.getEmail());
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
                request.setAttribute("firstName", user.getFirstName());
            }
        }
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
    @Override        
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Database dbAction = new Database();
        Boolean userIsValid;
        try {
            userIsValid = dbAction.prepareLogin(email, password);
        } catch (SQLException ex) {
            userIsValid = false;
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session;
        if(userIsValid)
        {
            Users user = null;
            try {
                user = dbAction.getUserByEmail(email);
            } catch (SQLException ex) {
                Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
            }
            session = request.getSession();
            session.setAttribute("User", user);
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
