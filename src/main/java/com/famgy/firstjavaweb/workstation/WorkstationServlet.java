package com.famgy.firstjavaweb.workstation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "WorkstationServlet", urlPatterns = {"/workstation"}, loadOnStartup = 1)
public class WorkstationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = this.getServletContext().getRealPath("/WEB-INF/fileUpload");

        ArrayList<Pfile> pfileList = PfileService.getPfileList(filePath);

        request.setAttribute("pfiles", pfileList);
        request.getRequestDispatcher("./WEB-INF/views/workstation.jsp").forward(request, response);
    }
}
