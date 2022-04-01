package com.filter;

import sun.awt.HKSCS;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

@WebFilter(filterName = "SessionFilter")
public class SessionFilter implements Filter {
    private ArrayList<String> urlList;

    public void init(FilterConfig fConfig) throws ServletException {

        String urls = fConfig.getInitParameter("avoid-urls");

        StringTokenizer token = new StringTokenizer(urls, ",");
        urlList = new ArrayList<String>();

        while (token.hasMoreTokens()) {
            urlList.add(token.nextToken());

        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse) response;
        String url = req.getServletPath();
        boolean allowedRequest = !urlList.contains(url);
        if (allowedRequest) {
            if (req.getSession().getAttribute("username") == null && req.getSession().getAttribute("adminname") == null) {
                req.getRequestDispatcher("login.jsp").forward(req,res);
            }
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        }

        chain.doFilter(req, res);
    }
}

