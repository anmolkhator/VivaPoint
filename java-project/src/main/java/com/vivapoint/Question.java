package com.vivapoint;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Question {
    private final int id, correct;
    private final String question, explanation;
    private String[] options;
    private int[] order = {0, 1, 2, 3};   // order[i] = original index of the option shown at position i
    private int chosen = -1;

    public Question(int id, String question, String[] options, int correct, String explanation) {
        this.id = id; this.question = question; this.options = options;
        this.correct = correct; this.explanation = explanation;
    }

    /** Shuffles the displayed answer order; the form still posts original indexes, so grading is unchanged. */
    public void shuffleOptions() {
        List<Integer> idx = new ArrayList<>(List.of(0, 1, 2, 3));
        Collections.shuffle(idx);
        String[] shown = new String[4];
        int[] ord = new int[4];
        for (int i = 0; i < 4; i++) { shown[i] = options[idx.get(i)]; ord[i] = idx.get(i); }
        options = shown;
        order = ord;
    }

    public int getId() { return id; }
    public String getQuestion() { return question; }
    public String[] getOptions() { return options; }
    public int[] getOrder() { return order; }
    public int getCorrect() { return correct; }
    public String getExplanation() { return explanation; }
    public int getChosen() { return chosen; }
    public void setChosen(int chosen) { this.chosen = chosen; }
}
