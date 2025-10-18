import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CTCommonService } from '../../shared/base/ct-common.service';
import { Observable } from 'rxjs';
import { AuthService } from '../../auth/auth.service'; 
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root', // Dịch vụ này sẽ được cung cấp ở cấp độ root, có nghĩa là nó sẽ sống trong toàn bộ ứng dụng
})
export class MenuService extends CTCommonService {
  url = environment.userManagerServer + '/api/Menu/GetAllMenuByCurrentUser';
  baseUrl = environment.userManagerServer;

  // constructor(protected override http: HttpClient, private authService: AuthService) {
  //   super(http);
  // }

  constructor(http: HttpClient, private authService: AuthService) {
    super(http);
  }

  getAllMenuByCurrentUser(): Observable<any> {
    // localStorage.setItem('authToken', this.authService.);

    return this.http.get<any>(`${this.url}`, {
      // withCredentials: true, // Quan trọng: Cho phép gửi cookies/token (nếu có)

      headers: this.getHeaders(),
    });
  }

  getAllPermisionByFeatureByCurrentUser(featureCode: string): Observable<any> { 
    let url = `api/Menu/GetAllPermisionByFeatureByCurrentUser?featureCode=${featureCode}`;

    return this.get(url, this.baseUrl);
  }
}
