package com.vivapoint;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Subject keys (as stored in the questions table) and their display names. */
public final class Subjects {
    public static final Map<String, String> NAMES;
    static {
        Map<String, String> m = new LinkedHashMap<>();
        m.put("python", "Python");
        m.put("dbms", "Database Systems");
        m.put("net", "Computer Networks");
        m.put("java", "Java Programming");
        m.put("web", "Web Technologies");
        m.put("os", "Operating Systems");
        NAMES = Collections.unmodifiableMap(m);
    }
    private Subjects() {}
}
