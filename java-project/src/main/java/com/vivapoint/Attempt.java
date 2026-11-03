package com.vivapoint;

public class Attempt {
    private final String subject, takenAt;
    private final int score, total;

    public Attempt(String subject, int score, int total, String takenAt) {
        this.subject = subject; this.score = score; this.total = total; this.takenAt = takenAt;
    }
    public String getSubject() { return subject; }
    public int getScore() { return score; }
    public int getTotal() { return total; }
    public String getTakenAt() { return takenAt; }
    public int getPercent() { return total == 0 ? 0 : score * 100 / total; }
}
