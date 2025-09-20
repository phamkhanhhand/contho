using Ocelot.DependencyInjection;
using Ocelot.Middleware;

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
