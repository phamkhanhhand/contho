using Microsoft.AspNetCore.Mvc;
using CT.Auth;
using Microsoft.AspNetCore.Authorization;

namespace CT.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {

        [HttpPost("test")]
        public async Task<IActionResult> testAsync([FromBody] CTLoginRequest request) 
        {

             await Task.Delay(millisecondsDelay: 3000); // đợi 3 giây 
            return Ok("Done after 3 seconds");

        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] CTLoginRequest request)
        {
                // 1. Kiểm tra user/pass
                var isPassLogin = CTAuthService.Login(request.Username, request.Password);

            if (!isPassLogin)
            {
                return Unauthorized();
            }

            var tokenString = CTJwtHelper.GenerateAccessToken(request.Username);

            var refreshToken = CTJwtHelper.GenerateSecureRefreshToken();

            //put refresh token to cookie. In oder to web app
            SetRefreshTokenInCookie(refreshToken);


            //todo lưu refreshToken vào db

            // Lưu refresh token vào memory hoặc DB (demo)
            CTAuthService.Save(refreshToken, request.Username);

            return Ok(new
            {
                access_token = tokenString,
                refresh_token = refreshToken
            });
        }


        // Cài đặt refresh token vào cookie
        private void SetRefreshTokenInCookie(string refreshToken)
        {
            var cookieOptions = new CookieOptions
            {
                HttpOnly = true,          //javascript cant not access
                Secure = true,            //only HTTPS
                SameSite = SameSiteMode.Strict, // block CSRF attacks
                Expires = DateTime.Now.AddDays(14) // 14 day cookie
            };

            // Đặt cookie với tên là "refresh_token" và giá trị là refresh token vừa tạo
            HttpContext.Response.Cookies.Append(Constant.RefreshTokenKey, refreshToken, cookieOptions);
        }


        [HttpPost("refresh")]
        public IActionResult RefreshToken([FromBody] CTRefreshRequest model)
        {

            var refreshToken = model.RefreshToken;


            if (String.IsNullOrWhiteSpace(refreshToken))
            {
                //get from cookie 
                if (Request.Cookies.ContainsKey(Constant.RefreshTokenKey))
                {
                    refreshToken = Request.Cookies[Constant.RefreshTokenKey];
                }
            }

            if (String.IsNullOrWhiteSpace(refreshToken))
            { 
                return Unauthorized("No authen, no refresh token");
            }

                var username = CTAuthService.GetUsernameByToken(refreshToken);
            if (username == null) return Unauthorized();

            var newAccessToken = CTJwtHelper.GenerateAccessToken(username);
            return Ok(new { access_token = newAccessToken });
        }

        [HttpPost("logout")]
        [Authorize] // Nếu bạn yêu cầu token hợp lệ để logout
        public IActionResult Logout([FromBody] CTLogoutRequest request)
        {
            var username = User.Identity?.Name;
            if (string.IsNullOrEmpty(username))
                return Unauthorized();

            // Xoá refresh token khỏi DB hoặc đánh dấu là revoked
            var token = request.RefreshToken;
            CTAuthService.Revoke(token);

            return Ok(new { message = "Logged out successfully" });
        }


        [HttpPost("signin")] 
        public IActionResult Signin([FromBody] CTLoginRequest request)
        {

            var isPassLogin = CTAuthService.Signin(request.Username, request.Password);

            if (isPassLogin)
            {

                return Ok(new { message = request.Username });
            }
            else
            {
                return Unauthorized();
            }
        }

    }

}