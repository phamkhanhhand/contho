import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { saveAs } from 'file-saver';

@Injectable({
  providedIn: 'root',
})
/*
 * Common service có xác thực qua interceptor
 * pkha - Updated: bỏ getHeaders vì đã dùng HttpInterceptor
 */
export class CTCommonService {
  protected apiUrl = 'https://api.example.com'; // Cập nhật tùy theo môi trường

  constructor(protected http: HttpClient) {}

  // Gửi file lên server (dạng multipart/form-data)
  import(formData: FormData, url: string) {
    return this.http.post(url, formData); // Không cần headers
  }

  // Tải file Excel từ API
  downloadFileImport(url: string, fileName: string) {
    this.http
      .get(url, {
        responseType: 'arraybuffer',
      })
      .subscribe(
        (response: ArrayBuffer) => {
          const blob = new Blob([response], {
            type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
          });
          saveAs(blob, fileName);
        },
        (error) => {
          console.error('Tải file không thành công', error);
        }
      );
  }

  // Các phương thức HTTP chung (headers đã do interceptor xử lý)
  get<T>(endpoint: string, url: string = this.apiUrl): Observable<T> {
    return this.http
      .get<T>(`${url}/${endpoint}`)
      .pipe(catchError(this.handleError<T>('get')));
  }

  post<T>(
    endpoint: string,
    body: any,
    url: string = this.apiUrl
  ): Observable<T> {
    return this.http
      .post<T>(`${url}/${endpoint}`, body)
      .pipe(catchError(this.handleError<T>('post')));
  }

  put<T>(
    endpoint: string,
    body: any,
    url: string = this.apiUrl
  ): Observable<T> {
    return this.http
      .put<T>(`${url}/${endpoint}`, body)
      .pipe(catchError(this.handleError<T>('put')));
  }

  delete<T>(endpoint: string, url: string = this.apiUrl): Observable<T> {
    return this.http
      .delete<T>(`${url}/${endpoint}`)
      .pipe(catchError(this.handleError<T>('delete')));
  }

  // Xử lý lỗi chung
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
