package com.phamkhanhhand.contho.budget_management.feign;

import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.config.FeignClientConfig;
import com.phamkhanhhand.contho.budget_management.model.Scope;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;
//@FeignClient(name = "user-service", url = "${provider.url}", configuration = FeignClientConfig.class)
@FeignClient(name = "user-service", url = "http://localhost:5087", configuration = FeignClientConfig.class)
//@FeignClient(name = "user-service", url = "http://localhost:5087")
public interface UserClient {
    @PostMapping("/api/Auth/test")
    Object getCurrentUser(@RequestBody Object param);
}

