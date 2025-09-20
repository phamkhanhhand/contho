using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();


//controller phải đặt [Authorize] thì mới authen cái này
// Cấu hình xác thực với JWT Token 
//for logout require authen
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        var pem = File.ReadAllText("Keys/public.pem");
        var rsa = RSA.Create();
        rsa.ImportFromPem(pem.ToCharArray());

        options.TokenValidationParameters = new TokenValidationParameters
        {
            //ValidateIssuerSigningKey = false
            ValidateIssuer = false,     // Bỏ qua việc kiểm tra Issuer
            ValidateAudience = false,   // Bỏ qua việc kiểm tra Audience
            ValidateLifetime = true,    // Kiểm tra thời gian hết hạn của token
            //ClockSkew = TimeSpan.Zero,   // Không có độ trễ cho thời gian hết hạn
            ValidateIssuerSigningKey = true, // Bỏ qua kiểm tra chữ ký của token

            IssuerSigningKey = new RsaSecurityKey(rsa),

        };

    });


var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseAuthorization();

app.MapControllers();

app.Run();
