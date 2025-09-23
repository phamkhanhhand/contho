import { OnInit, OnDestroy, Injector } from '@angular/core'; 
import { CTBaseComponent } from './ct-base.component';

export abstract class CTBaseListComponent<T> extends CTBaseComponent {
  items: T[] = [];
  isLoading: boolean = false;

  constructor(injector: Injector) {
    super(injector);
  }

  loadItems(): void {
    this.isLoading = true;
    // Logic tải danh sách item, có thể gọi dịch vụ ở đây.
    // Sau khi tải xong, cập nhật items và isLoading.
  }

  protected updateItems(newItems: T[]): void {
    this.items = newItems;
    this.isLoading = false;
  }
}
