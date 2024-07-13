package com.pdp.web_online_store.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;

@WebFilter(filterName = "SecurityFilter", value = "/*")
public class SecurityFilter implements Filter {


    private static final List<String> WHITE_LIST = List.of(
            "/",
            "/searchProduct",
            "/products",
            "/product/info",
            "/login",
            "/signup",
            "/register"
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
    private static final Predicate<String> isSellerPager = (uri) -> uri.startsWith("/seller");

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String requestURI = request.getRequestURI();
        System.out.println("requestURI = " + requestURI);
        if (requestURI.startsWith("/resources")) {
            chain.doFilter(request, response); // continue request for static resources
            return;
        }
        if (!isOpen.test(requestURI)) {
            HttpSession session = request.getSession();
            Object id = session.getAttribute("userID");
            Object role = session.getAttribute("role");
            if (Objects.isNull(id)) {
                response.sendRedirect("/register?next=" + requestURI);
            } else {
                if (Objects.equals("USER", role) && (isAdminPages.test(requestURI)
                        || isSellerPager.test(requestURI))) {
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
