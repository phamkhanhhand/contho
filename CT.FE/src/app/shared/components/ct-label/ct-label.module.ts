import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { CtLabelComponent } from './ct-label/ct-label.component';



@NgModule({
  declarations: [CtLabelComponent],
  imports: [
    CommonModule,
  ],
  exports: [CtLabelComponent]
})
export class CtLabelModule { }
