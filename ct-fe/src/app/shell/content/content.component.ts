import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrl: './content.component.scss',
})
export class ContentComponent implements OnChanges {
  @Input() isSidebarCollapsed: any = true;

  dynamicMarginLeft = '250px';

  ngOnChanges(changes: SimpleChanges) {
    // Kiểm tra sự thay đổi của myVar
    if (changes['isSidebarCollapsed']) {
      this.dynamicMarginLeft =
        this.isSidebarCollapsed == true ? ' 60px' : ' 250px ';
 
      // Yêu cầu Angular cập nhật giao diện (detect changes)
      // this.cdRef.detectChanges();
    }
  }
}
