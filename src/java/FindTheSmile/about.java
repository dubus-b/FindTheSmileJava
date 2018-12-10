/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

import java.io.IOException;
import java.io.PrintWriter;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bdubus
 */
public class about extends HttpServlet {
    @Override
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        HttpSession session = request.getSession(false);
        if (session != null)
        {
            Users user = (Users) session.getAttribute("User");
            if (user == null)
                session.invalidate();
            else
                request.setAttribute("firstName", user.getFirstName());
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/apropos.jsp").forward(request, response);
    }
}
