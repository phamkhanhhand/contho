import { Injectable } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Router,
} from '@angular/router';
import { AuthService } from './auth.service';
// import { AuthService } from './auth.service'; // hypothetical AuthService to manage auth state



/*
* util to decode token
*/

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  constructor(private authService: AuthService, private router: Router) {}

  decodeToken(token: string): any {
    const parts = token.split('.');

    if (parts.length !== 3) {
      throw new Error('JWT token is invalid');
    }

    const payload = parts[1];

    // Giải mã phần payload từ base64
    const decodedPayload = this.base64UrlDecode(payload);

    return JSON.parse(decodedPayload);
  }

  base64UrlDecode(str: string): string {
    // Thay thế các ký tự để phù hợp với base64
    str = str.replace(/-/g, '+').replace(/_/g, '/');

    // Thêm padding
    const pad = 4 - (str.length % 4);
    if (pad < 4) {
      str += '='.repeat(pad);
    }

    return atob(str);
  }
}
