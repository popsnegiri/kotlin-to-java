package com.theah64.k2j.utils;

public class JavaCodeBuilder {
    private final StringBuilder sb = new StringBuilder();

    @Override
    public String toString() {
        return sb.toString();
    }

    public void addLine(String line) {
        sb.append(line).append("\n");
    }
}
