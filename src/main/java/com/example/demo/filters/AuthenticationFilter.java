package com.example.demo.filters;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.example.demo.services.JwtTokenService;

import jakarta.servlet.http.*;
import jakarta.servlet.*;

@Component
@Order(1)
public class AuthenticationFilter implements Filter {

    @Autowired
    private JwtTokenService jwtTokeService;

    @Override
    public void doFilter(
      ServletRequest request, 
      ServletResponse response, 
      FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        String jwtToken = req.getHeader("authorization") != null && req.getHeader("authorization").split(" ").length > 1 ? req.getHeader("authorization").split(" ")[1] : "";

        String username =  jwtTokeService.validateTokenAndGetUsername(jwtToken);
        System.out.println(username);

        if(username != null){

            chain.doFilter(request, response);
        }
        else{

            resp.setContentType("application/json");
            resp.setStatus(403);
            resp.getWriter().write("{\"student\": null, \"status\": 403, \"message\": \"You do not have permission to access this url\"}");
        }

    }

    

}

