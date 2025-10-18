package com.phamkhanhhand.contho.budget_management.config;

import com.phamkhanhhand.contho.budget_management.security.JwtAuthenticationFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/auth/**").permitAll() // Cho phép các endpoint auth
                        .anyRequest().authenticated() // Các endpoint khác phải xác thực
                )
                .addFilterBefore(new com.phamkhanhhand.contho.budget_management.security.JwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                .httpBasic(Customizer.withDefaults()); // Hoặc bạn có thể bỏ dòng này

        return http.build();
    }
}
