import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { BehaviorSubject, catchError, filter, Observable, switchMap, take, throwError } from 'rxjs';
import { AuthService } from './auth.service';
import { Router } from '@angular/router';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  private isRefreshing = false;

  private refreshTokenSubject: BehaviorSubject<any> = new BehaviorSubject<any>(
    null
  );
  constructor(private authService: AuthService, private router: Router) {}

  intercept(
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    const token = this.authService.getToken();

    //check if token is available => refresh token 
    //then process the request. if 401 => refresh token


    if (token) {
      //check token is expired

      if (token && this.authService.isTokenExpired()) {
        return this.handleRefreshToken(req, next);
      }

      // Nếu token còn hạn, gắn token vào header
      if (token) {
        req = this.addTokenHeader(req, token);
      }

      return next
        .handle(req)
        .pipe(catchError((error) => this.handleError(error, req, next)));
         
    }

    // If no token, proceed without adding the Authorization header: e.g., for login requests
    return next.handle(req);
  }

  private handleRefreshToken(
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    if (!this.isRefreshing) {
      this.isRefreshing = true;
      this.refreshTokenSubject.next(null);

      return this.authService.refreshToken().pipe(
        switchMap((newToken: string) => {
          this.isRefreshing = false;
          this.authService.setToken(newToken);
          this.refreshTokenSubject.next(newToken);
          return next.handle(this.addTokenHeader(req, newToken));
        }),
        catchError((err) => {
          this.isRefreshing = false;
          this.authService.logout();
          this.router.navigate(['/login']);
          return throwError(err);
        })
      );
    } else {
      // Nếu đang refresh, đợi đến khi có token mới
      return this.refreshTokenSubject.pipe(
        filter((token) => token !== null),
        take(1),
        switchMap((newToken) => {
          return next.handle(this.addTokenHeader(req, newToken!));
        })
      );
    }
  }

  private addTokenHeader(
    req: HttpRequest<any>,
    token: string
  ): HttpRequest<any> {
    return req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`,
      },
    });
  }

  private handleError(
    error: HttpErrorResponse,
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    if (error.status === 401) {
      return this.handleRefreshToken(req, next);
    }
    return throwError(error);
  }
}
