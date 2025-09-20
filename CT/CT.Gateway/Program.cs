using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using System.Security.Cryptography;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

#region Oclelot

builder.Configuration.AddJsonFile("ocelot.json", optional: false, reloadOnChange: false);
builder.Services.AddOcelot();
builder.Services.AddEndpointsApiExplorer();
// Add services to the container.

#endregion



#region ADd cross (cho phép FE truy cập) 
// Thêm dịch vụ CORS vào DI container
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAngularApp", policy =>
    {
        policy.WithOrigins("http://localhost:4200", "http://localhost:51111/")  // Địa chỉ của frontend Angular
              .AllowAnyMethod()                    // Cho phép tất cả phương thức HTTP (GET, POST, PUT, DELETE...)
              .AllowAnyHeader()                    // Cho phép tất cả header
              .AllowCredentials();                 // Cho phép gửi cookie hoặc token (nếu cần)
    });


});

#endregion


// Thêm HttpClient (dependency injection vào controller)
builder.Services.AddHttpClient();

builder.Services.AddControllers();



builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        var pem = File.ReadAllText("Keys/public.pem");
        var rsa = RSA.Create();
        rsa.ImportFromPem(pem.ToCharArray());

        //options.Authority = "https://your-identity-server";  // URL của Identity Server
        //options.Audience = "your_api";  // Audience của API
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




        // Nếu bạn cần xử lý sự kiện, ví dụ log thông tin token hoặc kiểm tra thêm
        options.Events = new JwtBearerEvents
        { 
            OnAuthenticationFailed = context =>
            {
                Console.WriteLine($"Authentication failed: {context.Exception.Message}");
                return Task.CompletedTask;
            },
            OnTokenValidated = context =>
            {
                Console.WriteLine($"Token validated: {context.SecurityToken}");
                return Task.CompletedTask;
            }

        };


    });



var app = builder.Build();

// Sử dụng chính sách CORS đã cấu hình
app.UseCors("AllowAngularApp");

app.UseRouting();
// Configure the HTTP request pipeline.

app.UseAuthorization();

app.MapControllers();

#region Oclelot

await app.UseOcelot();
#endregion

app.Run();
