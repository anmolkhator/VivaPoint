package com.vivapoint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet({"/register", "/login", "/logout"})
public class AuthServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/logout")) {
            HttpSession s = req.getSession(false);
            if (s != null) s.invalidate();
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/views" + path + ".jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            switch (req.getServletPath()) {
                case "/register" -> register(req, res);
                case "/login" -> login(req, res);
                default -> res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse res) throws SQLException, ServletException, IOException {
        String name = val(req, "name"), email = val(req, "email").toLowerCase();
        String pw = req.getParameter("password"), pw2 = req.getParameter("confirm");
        String err = null;
        if (name.isEmpty() || name.length() > 100) err = "Enter your full name.";
        else if (email.length() > 150 || !email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) err = "Enter a valid email address.";
        else if (pw == null || pw.length() < 8) err = "Use a password of at least 8 characters.";
        else if (!pw.equals(pw2)) err = "Passwords do not match.";
        if (err != null) { back(req, res, "/register", err, name, email); return; }

        int id = UserDao.create(name, email, PasswordUtil.hash(pw));
        if (id < 0) { back(req, res, "/register", "That email is already registered. Try logging in.", name, email); return; }
        startSession(req, id, name);
        res.sendRedirect(req.getContextPath() + "/dashboard");
    }

    private void login(HttpServletRequest req, HttpServletResponse res) throws SQLException, ServletException, IOException {
        String email = val(req, "email").toLowerCase(), pw = req.getParameter("password");
        User u = UserDao.findByEmail(email);
        if (u == null || pw == null || !PasswordUtil.verify(pw, u.hash())) {
            back(req, res, "/login", "Wrong email or password.", "", email);
            return;
        }
        startSession(req, u.id(), u.name());
        res.sendRedirect(req.getContextPath() + "/dashboard");
    }

    private static void startSession(HttpServletRequest req, int id, String name) {
        HttpSession old = req.getSession(false);
        if (old != null) old.invalidate();           // new session id after login
        HttpSession s = req.getSession(true);
        s.setAttribute("uid", id);
        s.setAttribute("uname", name);
    }

    private static void back(HttpServletRequest req, HttpServletResponse res, String path, String error, String name, String email)
            throws ServletException, IOException {
        req.setAttribute("error", error);
        req.setAttribute("name", name);
        req.setAttribute("email", email);
        req.getRequestDispatcher("/WEB-INF/views" + path + ".jsp").forward(req, res);
    }

    private static String val(HttpServletRequest req, String key) {
        String v = req.getParameter(key);
        return v == null ? "" : v.trim();
    }
}
