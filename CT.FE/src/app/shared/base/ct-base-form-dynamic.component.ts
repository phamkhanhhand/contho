import { FormBuilder, FormGroup } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms'; 
import { Injector } from '@angular/core';
import { CTBaseFormComponent } from './ct-base-form.component';

export abstract class CTBaseFormDynamicComponent extends CTBaseFormComponent {
  constructor(injector: Injector,
    private fb: FormBuilder) {
    super(injector);
    // Khởi tạo form ở đây

    this.form = this.fb.group({
      //static field khai bao thoai mai

      staticField: [null], //demo thoi

      dynamicFields: this.fb.array([]),
    });
  }

  lstDynamic: [] = [];

  loadData() {
    //get data from service
    this.lstDynamic = [];
  }

  getFormData() {
    const formData = this.form?.value;
  }

  addDynamicField(lst: []) {

    lst.filter(x=>{
        this.form.patchValue({  x.key, x.value, });

    });
 
  }
}

 