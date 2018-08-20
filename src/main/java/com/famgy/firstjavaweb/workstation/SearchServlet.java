package com.famgy.firstjavaweb.workstation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "SearchServlet", urlPatterns = {"/search"}, loadOnStartup = 1)
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = this.getServletContext().getRealPath("./WEB-INF/fileUpload");

        String filterApk = request.getParameter("apkname");

        ArrayList<Pfile> pfileList = PfileService.getPfileListFilter(filePath, filterApk);

        request.setAttribute("pfiles", pfileList);
        request.getRequestDispatcher("./WEB-INF/views/workstation.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
