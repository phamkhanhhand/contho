import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { RouterModule } from '@angular/router';
import { DemoRoutingModule } from './demo-routing.module';
import { DemoComponent } from './pages/demo-list/demo.component';
import { CtLabelModule } from 'src/app/shared/components/ct-label';



@NgModule({
  declarations: [DemoComponent],
  imports: [
    CommonModule, 
    DemoRoutingModule,
    CtLabelModule,
  ],
  exports: [DemoComponent],
})
export class DemoModule { }
