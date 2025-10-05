package com.phamkhanhhand.contho.budget_management.common;

import com.phamkhanhhand.contho.budget_management.security.CustomUserDetails;
import com.phamkhanhhand.contho.budget_management.security.DataUserContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class UserContextUtil {
    public static DataUserContext getCurrentUserContext() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
            return new DataUserContext(
                    userDetails.getUsername(),
                    userDetails.getFullName(),
                    userDetails.getDepartment()
            );
        }
        return null;
    }
}
