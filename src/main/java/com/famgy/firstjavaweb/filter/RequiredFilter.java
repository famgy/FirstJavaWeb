package com.famgy.firstjavaweb.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "RequiredFilter", urlPatterns = {"/document","/workstation"})
public class RequiredFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //chain.doFilter(req, resp);

        HttpServletRequest request = (HttpServletRequest)req;

        if (request.getSession().getAttribute("name") != null) {
            chain.doFilter(req, resp);
        } else {
            request.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
