package com.vivapoint;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** Opens JDBC connections. Override the defaults with DB_URL, DB_USER and DB_PASS environment variables. */
public final class Db {
    static {
        try { Class.forName("com.mysql.cj.jdbc.Driver"); }
        catch (ClassNotFoundException e) { throw new ExceptionInInitializerError(e); }
    }
    private Db() {}
    private static String env(String key, String fallback) {
        String v = System.getenv(key);
        return (v == null || v.isEmpty()) ? fallback : v;
    }
    public static Connection get() throws SQLException {
        return DriverManager.getConnection(
            env("DB_URL", "jdbc:mysql://localhost:3306/vivapoint?useUnicode=true&characterEncoding=UTF-8"),
            env("DB_USER", "root"), env("DB_PASS", ""));
    }
}
