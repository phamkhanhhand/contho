import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';  
import { LoginComponent } from './shell/login/login.component'; 
import { AccessDeniedComponent } from './shell/access-denied/access-denied.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent }, // Route cho Home
 { path: 'access-denied', component: AccessDeniedComponent }, 

  {
    path: '',
    loadChildren: () =>
      import('./shell/shell.module').then((m) => m.ShellModule),
  }, // Route cho Home
 
];  

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
