package org.example.demo;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ThemeServlet", value = "/theme-servlet")
public class ThemeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theme = request.getParameter("theme");
        if (theme != null && !theme.isEmpty()) {
            // Create or update the cookie
            Cookie themeCookie = new Cookie("theme", theme);
            themeCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
            response.addCookie(themeCookie);
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
