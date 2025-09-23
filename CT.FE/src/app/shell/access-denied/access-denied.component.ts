import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-access-denied', 
  templateUrl: './access-denied.component.html',
  styleUrl: './access-denied.component.scss',
})
export class AccessDeniedComponent {
  constructor(private router: Router) {}

  goHome() {
    // Điều hướng về trang chủ khi người dùng bấm vào nút "Quay lại Trang Chủ"
    this.router.navigate(['/']);
  }
}
