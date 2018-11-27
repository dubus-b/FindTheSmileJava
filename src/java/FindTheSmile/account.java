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
public class account extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet account</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet account at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        HttpSession session = request.getSession(false);
        if (session.getAttribute("email") == null) {
            request.setAttribute("erreur", error.getUnauthorized());
            this.getServletContext().getRequestDispatcher("/WEB-INF/erreur.jsp").forward(request, response);
        } else {
            Object email = session.getAttribute("email");
            Database dbAction = new Database();
            Users user = null;
            try {
                user = dbAction.getUserByEmail((String) email);
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("email", user.getEmail());
            request.setAttribute("lastName", user.getLastName());
            request.setAttribute("firstName", user.getFirstName());
            request.setAttribute("phone", user.getPhoneNumber());
            request.setAttribute("birthDate", user.getBirthDate());
            this.getServletContext().getRequestDispatcher("/WEB-INF/account.jsp").forward(request, response);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session;
        session = request.getSession(false);
        String password = request.getParameter("newPasswd");
        String reinitScore = request.getParameter("scores");
        String mail = (String) session.getAttribute("email");
        Database dbAction = new Database();
        if (password != null) {
            Users user = null;
            try {
                user = dbAction.getUserByEmail(mail);
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (user.getPassword().equals(request.getParameter("oldPasswd"))) {
                try {
                    dbAction.updatePassword(mail, password);
                } catch (SQLException ex) {
                    Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
                }
                out.println("{\"password\" : \"updated\"}");
            } else {
                out.println("{\"password\" : \"wrong password\"}");
            }
        } else if (reinitScore != null) {
            try {
                dbAction.updateScore(0, 0, mail);
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.println("{\"scores\" : \"updated\"}");
        } else {
            String lastname = request.getParameter("lastName");
            String firstname = request.getParameter("firstName");
            String birthdate = request.getParameter("birthdate");
            String phone = request.getParameter("phone");
            Users user = new Users(lastname, firstname, birthdate, phone, mail, "", 0, 0);
            try {
                dbAction.updateUser(user);
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                user = dbAction.getUserByEmail(mail);
            } catch (SQLException ex) {
                Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("email", user.getEmail());
            request.setAttribute("lastName", user.getLastName());
            request.setAttribute("firstName", user.getFirstName());
            request.setAttribute("phone", user.getPhoneNumber());
            request.setAttribute("birthDate", user.getBirthDate());
            request.setAttribute("response", "Vos informations ont été actualisées");
            this.getServletContext().getRequestDispatcher("/WEB-INF/account.jsp").forward(request, response);
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
