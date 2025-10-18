import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router'; 
import { ShellComponent } from './layout/shell.component'; 

const routes: Routes = [
  {
    path: '',
    component: ShellComponent,

    children: [
      {
        path: 'demo',
        loadChildren: () =>
          import('../features/demo/demo.module').then((m) => m.DemoModule),
      },

      {
        path: 'employee-manage',
        loadChildren: () =>
          import('../features/employee-manage/employee-manage.module').then(
            (m) => m.EmployeeManageModule
          ),
      },

      {
        path: 'budget',
        loadChildren: () =>
          import('../features/budget/budget.module').then(
            (m) => m.BudgetModule
          ),
      },
 
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ShellRoutingModule { }
