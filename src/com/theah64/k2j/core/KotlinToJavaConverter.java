package com.theah64.k2j.core;

import com.theah64.k2j.utils.JavaCodeBuilder;

public class KotlinToJavaConverter {

    private static final String CREDITS = "// Converted using j2k";

    public static String convert(String kotlinCode) {

        final JavaCodeBuilder codeBuilder = new JavaCodeBuilder();

        // Adding credits
        codeBuilder.addLine(CREDITS);

        final String[] kLines = kotlinCode.split("\n");
        for (final String kLine : kLines) {

            final String jLine = convertLine(kLine);

            codeBuilder.addLine(jLine);
        }

        return codeBuilder.toString();
    }

    private static String convertLine(String kLine) {

        // checking it's a method signature
        if(isMethodSignature)

        return kLine;
    }
}
