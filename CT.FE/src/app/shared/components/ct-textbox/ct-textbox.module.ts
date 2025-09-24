import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { CtTextboxComponent } from './ct-textbox/ct-textbox.component';



@NgModule({
  declarations: [CtTextboxComponent],
  imports: [CommonModule],
  exports: [CtTextboxComponent]
})
export class CtTextboxModule {}
