package com.vivapoint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/** GET builds a 20-question quiz; POST grades it on the server and saves the attempt for the logged-in user. */
@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    private static final int QUESTIONS = 20;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        if (!valid(subject)) { toDashboard(req, res); return; }
        try {
            List<Question> qs = QuizDao.random(subject, QUESTIONS);
            qs.forEach(Question::shuffleOptions);   // different answer order each time
            if (qs.isEmpty()) { toDashboard(req, res); return; }
            req.setAttribute("subject", subject);
            req.setAttribute("subjectName", Subjects.NAMES.get(subject));
            req.setAttribute("questions", qs);
            req.getRequestDispatcher("/WEB-INF/views/quiz.jsp").forward(req, res);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        String[] ids = req.getParameterValues("qid");
        if (!valid(subject) || ids == null || ids.length == 0 || ids.length > 50) { toDashboard(req, res); return; }
        try {
            List<Question> review = new ArrayList<>();
            Set<Integer> seen = new HashSet<>();
            int score = 0;
            for (String raw : ids) {
                int id;
                try { id = Integer.parseInt(raw); } catch (NumberFormatException e) { continue; }
                if (!seen.add(id)) continue;                       // ignore duplicates
                Question q = QuizDao.byId(id);
                if (q == null) continue;
                int chosen = -1;
                try {
                    String a = req.getParameter("a" + id);
                    if (a != null) chosen = Integer.parseInt(a);
                } catch (NumberFormatException ignored) { }
                if (chosen < 0 || chosen > 3) chosen = -1;
                q.setChosen(chosen);
                if (chosen == q.getCorrect()) score++;
                review.add(q);
            }
            if (review.isEmpty()) { toDashboard(req, res); return; }
            int uid = (Integer) req.getSession().getAttribute("uid");
            QuizDao.saveAttempt(uid, subject, score, review.size());
            req.setAttribute("subject", subject);
            req.setAttribute("subjectName", Subjects.NAMES.get(subject));
            req.setAttribute("score", score);
            req.setAttribute("total", review.size());
            req.setAttribute("percent", score * 100 / review.size());
            req.setAttribute("review", review);
            req.getRequestDispatcher("/WEB-INF/views/result.jsp").forward(req, res);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private static boolean valid(String subject) { return subject != null && Subjects.NAMES.containsKey(subject); }
    private static void toDashboard(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.sendRedirect(req.getContextPath() + "/dashboard");
    }
}
