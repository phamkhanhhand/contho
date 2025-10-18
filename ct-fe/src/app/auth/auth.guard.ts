import { Injectable } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Router,
} from '@angular/router';
import { AuthService } from './auth.service';
// import { AuthService } from './auth.service'; // hypothetical AuthService to manage auth state

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {

 
     if (this.authService.isAuthenticated()) {
       return true;
     } else {
       //  this.router.navigate(['/user-manage/login']);
       this.router.navigate(['/login']);
       return false;
     }
      
  }
}
