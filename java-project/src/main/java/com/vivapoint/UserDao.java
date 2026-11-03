package com.vivapoint;

import java.sql.*;

public final class UserDao {
    private UserDao() {}

    /** Creates a user and returns the new id, or -1 if the email is already registered. */
    public static int create(String name, String email, String hash) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement(
                 "INSERT INTO users(name, email, password_hash) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, name); ps.setString(2, email); ps.setString(3, hash);
            ps.executeUpdate();
            try (ResultSet k = ps.getGeneratedKeys()) { k.next(); return k.getInt(1); }
        } catch (SQLIntegrityConstraintViolationException duplicate) {
            return -1;
        }
    }

    public static User findByEmail(String email) throws SQLException {
        try (Connection c = Db.get();
             PreparedStatement ps = c.prepareStatement("SELECT id, name, password_hash FROM users WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? new User(rs.getInt(1), rs.getString(2), rs.getString(3)) : null;
            }
        }
    }
}
