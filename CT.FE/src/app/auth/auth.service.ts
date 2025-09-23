import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root', // Dịch vụ này sẽ được cung cấp ở cấp độ root, có nghĩa là nó sẽ sống trong toàn bộ ứng dụng
})
export class AuthService {
  private apiUrl = `${environment.identityProvideServer}/api/IdentityProvider/login`; // URL của API đăng nhập
  // private apiUrl = `http://localhost:5279/api/IdentityProvider/login`; // URL của API đăng nhập

  constructor(private http: HttpClient) {}

  private loggedIn = false; // sample auth state
  isAuthenticated(): boolean {
    // Ideally, check with a real authentication mechanism
    return this.loggedIn;
  }

  private tokenKey = 'auth_token';

  setToken(token: string) {
    localStorage.setItem(this.tokenKey, token);
  }

  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  removeToken() {
    localStorage.removeItem(this.tokenKey);
  }

  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }

  // Đăng nhập và lấy token từ backend
  login(username: string, password: string): Observable<any> {
    const loginData = { username, password };

    // Gửi POST request với dữ liệu đăng nhập
    return this.http.post<any>(this.apiUrl, loginData);
  }

  logout() {
    this.removeToken();
  }
}
