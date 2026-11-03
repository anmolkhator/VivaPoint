package com.vivapoint;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public final class QuizDao {
    private static final DateTimeFormatter WHEN = DateTimeFormatter.ofPattern("d MMM yyyy, HH:mm");
    private QuizDao() {}

    public static List<Question> random(String subject, int n) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement("SELECT * FROM questions WHERE subject = ? ORDER BY RAND() LIMIT ?")) {
            ps.setString(1, subject); ps.setInt(2, n);
            try (ResultSet rs = ps.executeQuery()) {
                List<Question> list = new ArrayList<>();
                while (rs.next()) list.add(map(rs));
                return list;
            }
        }
    }

    public static Question byId(int id) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement("SELECT * FROM questions WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) { return rs.next() ? map(rs) : null; }
        }
    }

    public static void saveAttempt(int userId, String subject, int score, int total) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement("INSERT INTO attempts(user_id, subject, score, total) VALUES (?, ?, ?, ?)")) {
            ps.setInt(1, userId); ps.setString(2, subject); ps.setInt(3, score); ps.setInt(4, total);
            ps.executeUpdate();
        }
    }

    public static List<Attempt> attempts(int userId) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement(
                 "SELECT subject, score, total, taken_at FROM attempts WHERE user_id = ? ORDER BY taken_at DESC, id DESC LIMIT 50")) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                List<Attempt> list = new ArrayList<>();
                while (rs.next()) {
                    String key = rs.getString(1);
                    list.add(new Attempt(Subjects.NAMES.getOrDefault(key, key), rs.getInt(2), rs.getInt(3),
                        rs.getTimestamp(4).toLocalDateTime().format(WHEN)));
                }
                return list;
            }
        }
    }

    private static Question map(ResultSet rs) throws SQLException {
        return new Question(rs.getInt("id"), rs.getString("question"),
            new String[]{rs.getString("opt_a"), rs.getString("opt_b"), rs.getString("opt_c"), rs.getString("opt_d")},
            rs.getInt("correct"), rs.getString("explanation"));
    }
}
