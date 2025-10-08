package com.phamkhanhhand.contho.budget_management.aspect;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CheckPermission {
    String uri();
    String[] scopes();
}
