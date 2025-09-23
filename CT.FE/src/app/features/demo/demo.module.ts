import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DemoComponent } from './demo/demo.component';
import { RouterModule } from '@angular/router';
import { DemoRoutingModule } from './demo-routing.module';



@NgModule({
  declarations: [DemoComponent],
  imports: [
    CommonModule, 
    DemoRoutingModule
  ],
  exports: [DemoComponent],
})
export class DemoModule { }
