package com.famgy.firstjavaweb.workstation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoggingServlet", urlPatterns = {"/logging"}, loadOnStartup = 1)
public class LoggingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuffer stringBuffer = PfileService.getLastPackageLogging();

        request.setAttribute("loggingbuffer", stringBuffer);
        request.getRequestDispatcher("/WEB-INF/views/logging.jsp").forward(request, response);
    }
}
