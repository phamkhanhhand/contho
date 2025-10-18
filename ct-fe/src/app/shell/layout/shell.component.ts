import { Component, ViewChild } from '@angular/core'; 
import { AuthService } from 'src/app/auth/auth.service'; 

@Component({
  selector: 'app-shell',
  templateUrl: './shell.component.html',
  styleUrl: './shell.component.scss',
})
export class ShellComponent {
  title = 'Con tho NET';

  constructor(public authService: AuthService) {}
  ngOnInit() {}

  ngAfterViewInit(): void {}

  // @ViewChild('topbar') topbar!: TopbarComponent;

  isSidebarCollapsed: any = false;

  onCollapsedSidebar(isCollapsed: any) {
    this.isSidebarCollapsed = isCollapsed; 
  }
}
