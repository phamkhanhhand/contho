import { FormGroup } from '@angular/forms'; 
import { Injector } from '@angular/core';
import { CTBaseComponent } from './ct-base.component';

export abstract class CTBaseFormComponent extends CTBaseComponent {

  form!: FormGroup;

  constructor(injector: Injector) {
     super(injector);
    // Khởi tạo form ở đây
  }
  
  submitForm(): void {
    if (this.form?.valid) {
      // Logic gửi dữ liệu form
      this.onSubmit();
    } else {
      this.log('Form is invalid');
    }
  }

  protected abstract onSubmit(): void; // Phải được định nghĩa trong component con
}
