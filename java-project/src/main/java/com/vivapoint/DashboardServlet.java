package com.vivapoint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int uid = (Integer) req.getSession().getAttribute("uid");
        List<Attempt> attempts;
        try {
            attempts = QuizDao.attempts(uid);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        int n = attempts.size(), sum = 0, best = 0;
        Set<String> tried = new HashSet<>();
        for (Attempt a : attempts) {
            sum += a.getPercent();
            best = Math.max(best, a.getPercent());
            tried.add(a.getSubject());
        }
        List<Attempt> trend = new ArrayList<>(attempts.subList(0, Math.min(10, n)));
        Collections.reverse(trend);                       // oldest to newest for the chart

        List<Object[]> badges = List.of(
            new Object[]{"First steps", "Complete your first attempt", n >= 1},
            new Object[]{"Sharp", "Score 80% or more", best >= 80},
            new Object[]{"Consistent", "Complete 5 attempts", n >= 5},
            new Object[]{"All-rounder", "Try every subject", tried.size() >= Subjects.NAMES.size()},
            new Object[]{"Perfect", "Score 100%", best >= 100});

        req.setAttribute("attempts", attempts);
        req.setAttribute("count", n);
        req.setAttribute("avg", n == 0 ? 0 : sum / n);
        req.setAttribute("best", best);
        req.setAttribute("subjectsTried", tried.size());
        req.setAttribute("trend", trend);
        req.setAttribute("badges", badges);
        req.setAttribute("subjects", Subjects.NAMES);
        req.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(req, res);
    }
}
