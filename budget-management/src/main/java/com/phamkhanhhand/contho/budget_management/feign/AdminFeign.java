package com.phamkhanhhand.contho.budget_management.feign;

import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.model.Scope;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

//TODO get data from admin service, and cache
@Component
public class AdminFeign {

    public List<Scope> getListScopeByPermision(String username, String resourceCode){

        List<Scope> scopes = new ArrayList<>();
        scopes.add(Scope.builder() .scopeCode(Enumeration.Scopes.APPROVE) .build() );
        scopes.add(Scope.builder() .scopeCode(Enumeration.Scopes.COMPLETE) .build() );

        return scopes;

    }
}
