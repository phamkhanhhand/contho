**.net 8**

1.This gateway just Authentication, redirect service. No authornization (it's up to microservice)
2.User RSA to sign token
3.Cache Redis, Kafka is not throw across gateway, but each microservice to eachother directly

(
1.Gateway chỉ để xác thực, còn phân quyền thì tùy vào từng microservice
2.Sử dụng thuật toán RSA để xác thực
3.Các cache Redis, Kafka thì các microservice gọi nhau trực tiếp, không gọi qua gateway
)

3.**add dependancies from nudget:**
Microsoft.AspNetCore.Cors
Microsoft.AspNetCore.Authentication.JwtBearer
Ocelot
