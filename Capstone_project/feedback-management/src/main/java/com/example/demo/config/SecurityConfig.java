package com.example.demo.config;
import org.springframework.http.HttpMethod;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())

            .authorizeHttpRequests(auth -> auth

            	    .requestMatchers("/login", "/register", "/css/**").permitAll()

            	    .requestMatchers(HttpMethod.GET, "/").hasAnyRole("USER", "ADMIN")
            	    .requestMatchers(HttpMethod.POST, "/submit").hasAnyRole("USER", "ADMIN")

            	    // ✅ ADMIN ONLY (THIS IS ENOUGH)
            	    .requestMatchers("/admin/**").hasRole("ADMIN")

            	    .anyRequest().authenticated()
            	)


            .formLogin(form -> form
            	    .loginPage("/login")
            	    .successHandler(roleBasedSuccessHandler())
            	    .permitAll()
            	)


            .logout(logout -> logout
                .logoutSuccessUrl("/login?logout")
            );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public AuthenticationSuccessHandler roleBasedSuccessHandler() {
        return (HttpServletRequest request,
                HttpServletResponse response,
                Authentication authentication) -> {

            var authorities = authentication.getAuthorities();

            for (var authority : authorities) {
                if (authority.getAuthority().equals("ROLE_ADMIN")) {
                    response.sendRedirect("/admin");
                    return;
                }
            }

            // default for USER
            response.sendRedirect("/");
        };
    }

}
