package com.phamkhanhhand.contho.budget_management.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;

@Component
public class JwtTokenProvider {

    private final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256); // secret key random (bạn có thể dùng key khác)

    // Tạo token (thường bạn tạo khi login)
    public String createToken(String username, String fullName, String department) {
        Claims claims = Jwts.claims().setSubject(username);
        claims.put("fullName", fullName);
        claims.put("department", department);

        Date now = new Date();
        Date expiry = new Date(now.getTime() + 3600000); // 1h expiry

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(expiry)
                .signWith(key)
                .compact();
    }

    // Lấy username từ token
    public String getUsername(String token) {
        return Jwts.parserBuilder().setSigningKey(key).build()
                .parseClaimsJws(token).getBody().getSubject();
    }

    // Lấy thông tin fullName
    public String getFullName(String token) {
        return (String) Jwts.parserBuilder().setSigningKey(key).build()
                .parseClaimsJws(token).getBody().get("fullName");
    }

    // Lấy department
    public String getDepartment(String token) {
        return (String) Jwts.parserBuilder().setSigningKey(key).build()
                .parseClaimsJws(token).getBody().get("department");
    }

    // Validate token
    public boolean validateToken(String token) {
        try {
            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
            return true;
        } catch (JwtException | IllegalArgumentException ex) {
            return false;
        }
    }
}
