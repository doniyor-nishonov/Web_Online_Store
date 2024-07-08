package com.pdp.web_online_store.filters;

import com.pdp.web_online_store.dao.user.UsersDAO;
import com.pdp.web_online_store.entity.user.Users;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;

//@WebFilter(filterName = "SecurityFilter", value = "/*")
public class SecurityFilter implements Filter {

    private static final UsersDAO usersDAO = new UsersDAO();

    private static final List<String> WHITE_LIST = List.of(
            "/book/list",
            "/auth/login",
            "/auth/register",
            "/activation.*" /*,
            "/storage/show",
            "/file/download"*/
    );


    private static final Predicate<String> isOpen = o -> {
        for (String s : WHITE_LIST) {
            if (o.matches(s)) {
                return true;
            }
        }
        return false;
    };
    private static final Predicate<String> isAdminPages = (uri) -> uri.startsWith("/admin");

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String requestURI = request.getRequestURI();
        System.out.println("requestURI = " + requestURI);
        if (checkForRememberMe(request)) {
            chain.doFilter(request, response);
        } else {
            if (!isOpen.test(requestURI)) {
                HttpSession session = request.getSession();
                Object id = session.getAttribute("id");
                Object role = session.getAttribute("role");
                if (Objects.isNull(id)) {
                    response.sendRedirect("/auth/login?next=" + requestURI);
                } else {
                    if (Objects.equals("USER", role) && isAdminPages.test(requestURI)) {
                        response.sendError(403, "Permission denied");
                    } else {
                        chain.doFilter(request, response);
                    }
                }
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    private boolean checkForRememberMe(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("id") != null) return true;
        for (Cookie cookie : request.getCookies()) {
            String cookieName = cookie.getName();
            if (cookieName.equals("rememberMe")) {
                Users user = usersDAO.findById(cookie.getValue());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("role", user.getRole());
                session.setAttribute("id", user.getId());
                return true;
            }
        }
        return false;
    }
}
