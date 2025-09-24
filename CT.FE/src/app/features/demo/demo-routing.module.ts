import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';   
import { DemoComponent } from './pages/demo-list/demo.component';

const routes: Routes = [
  {
    path: '',
    component: DemoComponent,

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
export class DemoRoutingModule { }
