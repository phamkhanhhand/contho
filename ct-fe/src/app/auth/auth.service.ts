import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root', // Dịch vụ này sẽ được cung cấp ở cấp độ root, có nghĩa là nó sẽ sống trong toàn bộ ứng dụng
})
export class AuthService {
  private apiUrl = `${environment.identityProvideServer}/api/IdentityProvider/login`; // URL của API đăng nhập
  // private apiUrl = `http://localhost:5279/api/IdentityProvider/login`; // URL của API đăng nhập

  private MemoryStore: {
    access_token: string;
    refresh_token: string;
  } = { access_token: '', refresh_token: '' };
  constructor(private http: HttpClient) {}

  private loggedIn = false; // sample auth state
  isAuthenticated(): boolean {
    // Ideally, check with a real authentication mechanism
    return this.loggedIn && !this.isTokenExpired();
  }

  private tokenKey = 'access_token';

  setToken(token: string) {
    this.MemoryStore.access_token = token;
  }

  getToken(): string | null {
    return this.MemoryStore.access_token;
  }

  removeToken() {
    this.MemoryStore.access_token = '';
  }

  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }

  //refresh token from cache to backend
  refreshToken(): Observable<string> {
    return this.http
      .post<{ token: string }>('/api/refresh-token', {})
      .pipe(map((response) => response.token));
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

  isTokenExpired(): boolean {
    try {
      const payload = JSON.parse(
        atob(this.MemoryStore?.access_token?.split('.')[1])
      );
      const expiry = payload.exp;
      const now = Math.floor(Date.now() / 1000); // Giây
      return expiry < now;
    } catch (e) {
      return true; // Nếu decode lỗi => xử lý như là token hết hạn
    }
  }
}
