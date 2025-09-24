import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';   
import { EmployeeListComponent } from './pages/employee-list/employee-list.component';

const routes: Routes = [
  {
    path: '',
    component: EmployeeListComponent,

    // children: [
    //   // {
    //   //   path: 'demo-detail',
    //   //   loadChildren: () =>
    //   //     import').then(
    //   //       (m) => m.DemoModule
    //   //     ),
    //   // },

    // ],
  }, 
  {
    path: '**',
    redirectTo: '',
    pathMatch: 'full',
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeManageRoutingModule { }
