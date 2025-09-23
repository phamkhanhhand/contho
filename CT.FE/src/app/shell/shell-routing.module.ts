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
          import('../features/demo/demo.module').then(
            (m) => m.DemoModule
          ),
      },

      // {
      //   path: 'system-admin',
      //   loadChildren: () =>
      //     import('../features/system-admin/system-admin.module').then(
      //       (m) => m.SystemAdminModule
      //     ),
      // },
      // {
      //   path: '',
      //   loadChildren: () =>
      //     import('../features/system-admin/system-admin.module').then(
      //       (m) => m.SystemAdminModule
      //     ),
      // },
      // {
      //   path: 'demo11',
      //   loadChildren: () =>
      //     import('../features/example/demo/demo.module').then(
      //       (m) => m.DemoModule
      //     ),
      // },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ShellRoutingModule { }
