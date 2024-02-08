package com.example.demo.services;

import java.time.Duration;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;

@Service
public class JwtTokenService {

    private static final Duration JWT_TOKEN_VALIDITY = Duration.ofMinutes(20);

    private final Algorithm hmac512;
    private final JWTVerifier verifier;

    public JwtTokenService(@Value("cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e") final String secret) {
        
        this.hmac512 = Algorithm.HMAC512(secret);
        this.verifier = JWT.require(this.hmac512).build();
    }

    public String generateToken() {
        
        final Instant now = Instant.now();
        
        try{

            return JWT.create()
                .withClaim("Roles", "USER_ADMIN")
                .withClaim("name", "Keven Tep")
                .withSubject("Keven Tep")
                .withIssuer("app")
                .withIssuedAt(now)
                .withExpiresAt(now.plusMillis(JWT_TOKEN_VALIDITY.toMillis()))
                .sign(this.hmac512);
        }
        catch(Exception ex){
            
            return null;
        }
    }

    public String validateTokenAndGetUsername(final String token) {
        try {
            return verifier.verify(token).getClaim("name").asString();
        } catch (final JWTVerificationException ex) {
            System.out.println("token invalid: " + ex.getMessage());
            return null;
        }
    }
}
