package com.phamkhanhhand.contho.budget_management.aspect;
import jakarta.servlet.Filter;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class ServletResponseHolder implements Filter {

    public static final ThreadLocal<HttpServletResponse> responseHolder = new ThreadLocal<>();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            responseHolder.set((HttpServletResponse) response);
            chain.doFilter(request, response);
        } finally {
            responseHolder.remove(); // Đảm bảo tránh memory leak
        }
    }

    public static HttpServletResponse getResponse() {
        return responseHolder.get();
    }
}
