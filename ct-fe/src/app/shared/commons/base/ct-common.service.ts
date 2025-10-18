import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

 import { saveAs } from 'file-saver';  // Dùng thư viện file-saver để lưu file

@Injectable({
  providedIn: 'root',
})

/*
 * Common service có xác thực
 * pkha Aug 24, 2024
 */
export class CTCommonService {
  protected apiUrl = 'https://api.example.com'; // Thay đổi thành URL API của bạn

  constructor(protected http: HttpClient) {}

  import(formData: FormData, url: string) {
    // Gửi file lên server
    return this.http.post(url, formData, {
      headers: new HttpHeaders(),
    });
  }

  downloadFileImport(url: string, fileName: string) {
    // Gửi yêu cầu GET đến API để tải file
    this.http
      .get(url, {
        responseType: 'arraybuffer',
      })
      .subscribe(
        (response: ArrayBuffer) => {
          // Chuyển ArrayBuffer thành Blob
          const blob = new Blob([response], {
            type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
          });

          // Tạo URL từ Blob và bắt đầu tải xuống
          saveAs(blob, fileName); // Sử dụng file-saver để tải file xuống
        },
        (error) => {
          console.error('Tải file không thành công', error);
        }
      );
  }

  getHeaders(): HttpHeaders {
    const token = localStorage.getItem('auth_token'); // Hoặc lấy token từ nơi bạn lưu trữ
    return new HttpHeaders({
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
    });
  }

  get<T>(endpoint: string, url: string = this.apiUrl): Observable<T> {
    return this.http
      .get<T>(`${url}/${endpoint}`, { headers: this.getHeaders() })
      .pipe(catchError(this.handleError<T>('get')));
  }

  post<T>(
    endpoint: string,
    body: any,
    url: string = this.apiUrl
  ): Observable<T> {
    return this.http
      .post<T>(`${url}/${endpoint}`, body, {
        headers: this.getHeaders(),
      })
      .pipe(catchError(this.handleError<T>('post')));
  }

  put<T>(
    endpoint: string,
    body: any,
    url: string = this.apiUrl
  ): Observable<T> {
    return this.http
      .put<T>(`${url}/${endpoint}`, body, {
        headers: this.getHeaders(),
      })
      .pipe(catchError(this.handleError<T>('put')));
  }

  delete<T>(endpoint: string, url: string = this.apiUrl): Observable<T> {
    return this.http
      .delete<T>(`${url}/${endpoint}`, { headers: this.getHeaders() })
      .pipe(catchError(this.handleError<T>('delete')));
  }

  // protected handleError<T>(operation = 'operation') {
  //   return (error: any): Observable<T> => {
  //     console.error(`${operation} failed: ${error.message}`);
  //     // Có thể gửi lỗi đến một dịch vụ log hoặc xử lý ở đây
  //     return new Observable<T>();
  //   };
  // }

  protected handleError<T>(operation = 'operation') {
    return (error: any): Observable<T> => {
      console.error(`[${operation}] failed:`, error);
      return throwError(
        () =>
          new Error(`${operation} failed: ${error.message || 'Unknown error'}`)
      );
    };
  }

}






// import { Component, OnInit } from '@angular/core';
// import { CommonService } from './common.service';

// @Component({
//   selector: 'app-example',
//   templateUrl: './example.component.html',
// })
// export class ExampleComponent implements OnInit {
//   constructor(private commonService: CommonService) {}

//   ngOnInit() {
//     this.getData();
//   }

//   getData() {
//     this.commonService.get('endpoint').subscribe((data) => {
//       console.log(data);
//     });
//   }

//   addData() {
//     this.commonService
//       .post('endpoint', { key: 'value' })
//       .subscribe((response) => {
//         console.log(response);
//       });
//   }

//   updateData() {
//     this.commonService
//       .put('endpoint/1', { key: 'updatedValue' })
//       .subscribe((response) => {
//         console.log(response);
//       });
//   }

//   deleteData() {
//     this.commonService.delete('endpoint/1').subscribe((response) => {
//       console.log(response);
//     });
//   }
// }





// Lưu ý
// Đảm bảo bạn đã import HttpClientModule trong AppModule của bạn:
 
// Copy
// import { HttpClientModule } from '@angular/common/http';

// @NgModule({
//   declarations: [
//     // các component của bạn
//   ],
//   imports: [
//     HttpClientModule,
//     // các module khác
//   ],
//   providers: [],
//   bootstrap: [AppComponent]
// })
// export class AppModule { }