//package com.likelion.week81_82.config;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import lombok.RequiredArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Date;
//import java.util.Enumeration;
//import java.util.HashMap;
//import java.util.Map;
//
//@Component
//@RequiredArgsConstructor
//public class AppFilter implements Filter {
//    private final ObjectMapper mapper;
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) servletRequest;
//        HttpServletResponse res = (HttpServletResponse) servletResponse;
//
//        String requestUser = req.getHeader("user-agent");
//        if(requestUser.contains("Postman")){
//            Map<String, Object> errorDetails = new HashMap<>();
//            errorDetails.put("timestamp", new Date().toString());
//            errorDetails.put("message", "Ban dang yeu cau tu Postman");
//            errorDetails.put("status", HttpStatus.FORBIDDEN.value());
//            errorDetails.put("error", HttpStatus.FORBIDDEN.name());
//            errorDetails.put("path", req.getServletPath());
//            mapper.writeValue(res.getWriter(), errorDetails);
//        }
//        filterChain.doFilter(req, res);
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);
//    }
//
//    @Override
//    public void destroy() {
//        Filter.super.destroy();
//    }
//}
