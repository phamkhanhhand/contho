import { OnInit, OnDestroy, Component, Injectable, Injector } from '@angular/core';
import { Router } from '@angular/router';
import { MenuService } from 'src/app/shell/sidebar/menu.service'; 


@Injectable({
  providedIn: 'root',
})
export abstract class CTBaseComponent implements OnInit, OnDestroy {
  protected menuService!: MenuService;

  protected router!: Router;
  protected injector: Injector; //tiêm những thứ service vào

  /*
   * mã chức năng (để đối chiếu quyền thêm, sửa xóa)
   * phamha
   */
  protected featureCode: string = '';

  /*
   * Quyền đã convert sang object, để check xem có quyền hay không
   * phamha
   */
  protected obFunction: any = {};

  constructor(injector: Injector) {
    this.injector = injector; // Lưu trữ Injector trong lớp cha
  }

  ngOnInit() {
    //lấy menu service
    this.menuService = this.injector.get(MenuService);
    this.router = this.injector.get(Router);

    //Lấy tất cả quyền thêm, sửa, xóa.... của user hiện tại ứng với function này
    this.menuService
      .getAllPermisionByFeatureByCurrentUser(this.featureCode)
      .subscribe((data) => {
        if (data) {
 

          this.convertFunctionToPermision(data);

          if (!this.obFunction.view) {
       //     this.router.navigate(['/access-denied']);
          }
        }
      });
  }

  /* * phamha 
  chuyển quyền sang object
  */
  private convertFunctionToPermision(data: any[]) {
    data.filter((x) => {
      switch (x.functionCode) {
        case 'ADD':
          this.obFunction.add = true;
          break;

        case 'EDIT':
          this.obFunction.edit = true;
          break;
        case 'DELETE':
          this.obFunction.delete = true;
          break;

        case 'VIEW':
          this.obFunction.view = true;
          break;
        case 'DETAIL':
          this.obFunction.detail = true;
          break;
        case 'APPROVE':
          this.obFunction.approve = true;
          break;
        case 'SEND':
          this.obFunction.send = true;
          break;
        case 'APPROVE_KTV':
          this.obFunction.approveKTV = true;
          break;
        case 'APPROVE_KSV':
          this.obFunction.approveKSV = true;
          break;
      }
    });
  }

  ngOnDestroy() {
    // Logic dọn dẹp chung cho tất cả các component
    console.log('BaseComponent destroyed');
  }

  protected log(message: string): void {
    console.log(`[BaseComponent]: ${message}`);
  }
}
