 

import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { TokenService } from 'src/app/auth/token.service';
// import { LoginService } from 'src/app/service/login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';
  loginError: boolean = false;

  constructor(
    private loginService: AuthService,
    private router: Router,
    private tokenService: TokenService
  ) {}

  onSubmit() {
    this.loginService.login(this.username, this.password).subscribe(
      (response) => { 
        // Lưu token vào localStorage
        this.loginService.setToken(response.accessToken); // Giả sử backend trả về { token: 'xyz' }

        let loginInfo = this.tokenService.decodeToken(response.accessToken);

        let curentUsername =
          loginInfo[
            'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'
          ]; 
      
      

          //todo add more info to localstorage
          localStorage.setItem('curentUsername', curentUsername);
  
        this.router.navigate(['']); // Điều hướng sau khi đăng nhập thành công

        this.loginError = false;
      },
      (error) => {
        this.loginError = true;
      }
    );
  }
}
