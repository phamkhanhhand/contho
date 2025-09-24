import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { EmployeeListComponent } from './pages/employee-list/employee-list.component';
import { EmployeeManageRoutingModule } from './employee-manage-routing.module';



@NgModule({
  declarations: [EmployeeListComponent],
  imports: [CommonModule, 
    EmployeeManageRoutingModule
  ],
  exports: [EmployeeListComponent],
})
export class EmployeeManageModule {}
