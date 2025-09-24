import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'DivideListPipe',
})
/*
* Phân chia 1 mảng thành các nhóm phần tử liền kề: vd: 2 phần tử liền kề làm 1
* phamha Oct 09, 2024
*/
export class DivideListPipe implements PipeTransform {


  transform(value: any[], numberDivide:number=2): any[] {
    if (!Array.isArray(value)) {
      return value;
    }

    const groupedArray: any[] = [];
    for (let i = 0; i < value.length; i += numberDivide) {
      groupedArray.push(value.slice(i, i + numberDivide));
    }

    return groupedArray;
  }
}

/*
su dung:

  declarations: [ 
    GroupByTwoPipe // Đăng ký pipe
]

<div *ngFor="let group of myArray | groupByTwo:2">
  <div>{{ group }}</div>
</div>


*/