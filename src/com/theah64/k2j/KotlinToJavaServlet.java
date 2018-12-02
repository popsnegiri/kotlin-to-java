package com.theah64.k2j;

import com.theah64.k2j.core.KotlinToJavaConverter;
import com.theah64.k2j.utils.RequestException;
import com.theah64.k2j.utils.Response;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/get_kotlin_to_java"})
public class KotlinToJavaServlet extends HttpServlet {

    private static final String KEY_KOTLIN_CODE = "kotlin_code";
    private static final String KEY_JAVA_CODE = "java_code";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");

        try {

            final String kotlinCode = req.getParameter(KEY_KOTLIN_CODE);

            if (kotlinCode == null || kotlinCode.trim().isEmpty()) {
                throw new RequestException(KEY_KOTLIN_CODE + " can't be empty");
            }

            // Converting to java
            final String javaCode = KotlinToJavaConverter.convert(kotlinCode);

            // output
            resp.getWriter().write(new Response("Success", KEY_JAVA_CODE, javaCode).getResponse());

        } catch (RequestException | JSONException e) {
            e.printStackTrace();
            resp.getWriter().write(new Response(e.getMessage()).getResponse());
        }

    }
}
