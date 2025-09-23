import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ShellRoutingModule } from './shell-routing.module';  
import { ContentComponent } from './content/content.component'; 
import { FormsModule } from '@angular/forms';
import { ShellComponent } from './layout/shell.component'; 
@NgModule({
  declarations: [
    ShellComponent, 
    ContentComponent,
  ],
  imports: [CommonModule, ShellRoutingModule, FormsModule],
})
export class ShellModule {}
