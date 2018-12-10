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
public class Game extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Error error = new Error();
        HttpSession session;
        session = request.getSession(false);
        if (session != null) {
            if (session.getAttribute("User") != null) {
                Users currentUser = (Users) session.getAttribute("User");
                Database database = new Database();
                try {
                    currentUser = database.getUserByEmail(currentUser.getEmail());
                } catch (SQLException ex) {
                    Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("firstName", currentUser.getFirstName());
                request.setAttribute("bestScore", currentUser.getBestScore());
                request.setAttribute("lastScore", currentUser.getLastScore());
                this.getServletContext().getRequestDispatcher("/WEB-INF/jeu.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("erreur", error.getUnauthorized());
            this.getServletContext().getRequestDispatcher("/WEB-INF/erreur.jsp").forward(request, response);
        }
    }
}
