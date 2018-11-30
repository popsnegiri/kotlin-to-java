package com.theah64.k2j;

import com.theah64.k2j.utils.RequestException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class KotlinToJavaServlet extends HttpServlet {

    private static final String KEY_KOTLIN_CODE = "kotlin_code";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);

        try {


            final String kotlinCode = req.getParameter(KEY_KOTLIN_CODE);

            if (kotlinCode == null || kotlinCode.trim().isEmpty()) {
                throw new RequestException(KEY_KOTLIN_CODE + " can't be empty");
            }


        } catch (RequestException e) {
            e.printStackTrace();

        }

    }
}
