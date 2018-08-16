package com.famgy.firstjavaweb.workstation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

@WebServlet(name = "DeleteServlet", urlPatterns = {"/delete"}, loadOnStartup = 1)
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = this.getServletContext().getRealPath("/WEB-INF/fileUpload");
        String fileName = request.getParameter("filename");
        String fileFullPath = filePath + "/" + fileName;

        File file = new File(fileFullPath);
        if (file.exists()) {
            file.delete();
        }

        request.getRequestDispatcher("/workstation").forward(request, response);;
    }
}
