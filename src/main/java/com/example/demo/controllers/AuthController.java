package com.example.demo.controllers;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.entity.HttpResponse;
import com.example.demo.services.JwtTokenService;


@RestController
public class AuthController {

    
    private JwtTokenService jwtTokenService = new JwtTokenService("cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e");
    
     @PostMapping("/authenticate")
    public HttpResponse authenticate() {

        final String token = jwtTokenService.generateToken();
        final HttpResponse authenticationResponse = new HttpResponse(null, token != null ? 200 : 404, token);
        return authenticationResponse;
    }
}
