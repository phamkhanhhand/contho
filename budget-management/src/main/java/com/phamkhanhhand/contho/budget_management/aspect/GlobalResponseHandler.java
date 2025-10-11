package com.phamkhanhhand.contho.budget_management.aspect;

import com.phamkhanhhand.contho.budget_management.dto.mapper.ResponseWrapper;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@ControllerAdvice
public class GlobalResponseHandler implements ResponseBodyAdvice<Object> {

    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body,
                                  MethodParameter returnType,
                                  MediaType selectedContentType,
                                  Class<? extends HttpMessageConverter<?>> selectedConverterType,
                                  ServerHttpRequest request,
                                  ServerHttpResponse response) {

        // Tránh bọc lại nếu đã được bọc sẵn
        if (body instanceof ResponseWrapper<?>) {
            return body;
        }

        // Lấy thông tin từ header request
        String transactionId = request.getHeaders().getFirst("TransactionId");
        String clientMessageId = request.getHeaders().getFirst("ClientMessageId");

        // Mặc định HTTP status là 200 OK (vì không thể lấy trực tiếp từ ServerHttpResponse)
        int statusCode = HttpStatus.OK.value();
        String message = HttpStatus.OK.getReasonPhrase();


        HttpServletResponse servletResponse = ServletResponseHolder.getResponse();
        statusCode = servletResponse != null ? servletResponse.getStatus() : HttpStatus.OK.value();
        message = HttpStatus.resolve(statusCode) != null
                ? HttpStatus.resolve(statusCode).getReasonPhrase()
                : "Unknown Status";


        return new ResponseWrapper<Object>(
                statusCode,
                message,
                clientMessageId,
                body
        );
    }
}
