package com.famgy.firstjavaweb.workstation;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@WebServlet(name = "DeleteServlet", urlPatterns = {"/delete"}, loadOnStartup = 1)
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = this.getServletContext().getRealPath("./WEB-INF/fileUpload");
        String fileName = request.getParameter("name");
        String fileFullPath = filePath + "/" + fileName;

        File file = new File(fileFullPath);
        if (file.exists()) {
            file.delete();
        }

        PrintWriter writer = response.getWriter();
        response.setContentType("application/json");
        JSONArray json = new JSONArray();

        JSONObject jsono = new JSONObject();
        jsono.put("success", 1);
        json.put(jsono);

        writer.write(json.toString());
        writer.close();

//        request.getRequestDispatcher("/workstation").forward(request, response);
    }
}
