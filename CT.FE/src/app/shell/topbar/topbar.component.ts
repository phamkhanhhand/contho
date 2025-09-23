 
// // topbar.component.ts
// import { ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
// import { Router } from '@angular/router';
// import { AuthService } from 'src/app/auth/auth.service';
// import { CTSessionStorageService } from 'src/app/shared/components/ct-services/ct-session-storage.service';
 
// @Component({
//   selector: 'app-topbar',
//   templateUrl: './topbar.component.html',
//   styleUrl: './topbar.component.scss',
// })
// export class TopbarComponent implements OnInit, OnChanges {
//   // Biến trạng thái cho đăng nhập
//   isLoggedIn: boolean = false;

//   private tokenKey = 'auth_token';
//    curentUsername=localStorage.getItem('curentUsername');

//   @Input() isSidebarCollapsed: any = true;
//   // dynamicWidth = "'width': 'calc(100% - 250px)';";
//   dynamicWidth =
//     this.isSidebarCollapsed == true
//       ? ' calc(100% - 60px) '
//       : ' calc(100% - 250px) ';

//   constructor(
//     private khSessionStorageService: CTSessionStorageService,
//     private authService: AuthService,
//     private router: Router,

//     private cdRef: ChangeDetectorRef
//   ) {}

//   ngOnInit(): void {
//     this.isSidebarCollapsed =
//       this.khSessionStorageService.getItem('isSidebarCollapsed');

//       this.isLoggedIn = localStorage.getItem(this.tokenKey)? true:false;
//   }

//   ngOnChanges(changes: SimpleChanges) {
//     // Kiểm tra sự thay đổi của myVar
//     if (changes['isSidebarCollapsed']) {
//       this.dynamicWidth =
//         this.isSidebarCollapsed == true
//           ? ' calc(100% - 60px) '
//           : ' calc(100% - 250px) ';

//       //không ảnh hưởng gì
//       this.dynamicWidth = ' 100% ';
//       // Yêu cầu Angular cập nhật giao diện (detect changes)
//       // this.cdRef.detectChanges();
//     }
//   }
//   handleLogin(): void {
   
//        this.router.navigate(['/login']);
//   }
//   handleLogout() {
//     this.authService.removeToken();  
     
//      localStorage.removeItem('curentUsername');
//      this.curentUsername='';
//        this.router.navigate(['/login']);
//   }

//   openSettings(): void {
//     console.log('isSidebarCollapsed:' + this.isSidebarCollapsed);
//   }
// }

