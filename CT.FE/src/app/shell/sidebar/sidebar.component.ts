// import { Component, Output, EventEmitter, OnInit } from '@angular/core';
// import { MenuService } from 'src/app/shell/sidebar/menu.service';
// import { CTLocalStorageService } from 'src/app/shared/components/ct-services/ct-local-storage.service';
// import { CTSessionStorageService } from 'src/app/shared/components/ct-services/ct-session-storage.service';
 

// @Component({
//   selector: 'app-sidebar',
//   templateUrl: './sidebar.component.html',
//   styleUrl: './sidebar.component.scss',
// })
// export class SidebarComponent implements OnInit {
//   constructor(
//     private khSessionStorageService: CTSessionStorageService,
//     private khLocalStorageService: CTLocalStorageService,

//     private menuService: MenuService
//   ) {}

//   @Output() onCollapsed = new EventEmitter<any>();
//   companyName = 'IT Family';
//   isSidebarCollapsed = false;
//   classColslap: 'fa-arrow-right' | 'fa-arrow-left' = 'fa-arrow-left';

//   lstMenu: any[] = [];

//   ngOnInit(): void {
//     this.menuService.getAllMenuByCurrentUser().subscribe((data) => {
//       this.lstMenu = data;
//     });
//   }

//   toggleSidebar() {
//     this.isSidebarCollapsed = !this.isSidebarCollapsed;

//     this.khLocalStorageService.setItem(
//       'isSidebarCollapsed',
//       this.isSidebarCollapsed
//     );
//     this.expandMenu();

//     this.onCollapsed.emit(this.isSidebarCollapsed); // Phát ra sự kiện
//   }
//   ngAfterViewInit() {
//     setTimeout(() => {
//       this.isSidebarCollapsed = this.khLocalStorageService.getItem(
//         'isSidebarCollapsed'
//       )
//         ? true
//         : false;

//       this.expandMenu();
//     });
//   }

//   expandMenu() {
//     if (this.isSidebarCollapsed) {
//       this.companyName = 'ITF';
//     } else {
//       this.companyName = 'IT Family';
//     }
//     this.classColslap = this.isSidebarCollapsed
//       ? 'fa-arrow-right'
//       : 'fa-arrow-left';

//     this.onCollapsed.emit(this.isSidebarCollapsed); // Phát ra sự kiện
//   }
// }
