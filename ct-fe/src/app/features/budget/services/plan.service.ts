import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Plan } from '../models/plan.model';
import { CTCommonService } from 'src/app/shared/commons/base/ct-common.service';

@Injectable({
  providedIn: 'root',
})
export class PlanService extends CTCommonService {
  override apiUrl = 'https://api.example.com/plans'; // Thay bằng URL thật của bạn

  constructor(protected override http: HttpClient) {
    super(http);
  }

  // Tính tổng amount từ detail và cập nhật vào plan.amount
  calculatePlanTotal(plan: Plan): Plan {
    const total = plan.details.reduce((sum, detail) => sum + detail.amount, 0);
    return {
      ...plan,
      amount: total,
    };
  }

  getPlans(): Observable<Plan[]> {
    return this.http
      .get<Plan[]>(this.apiUrl)
      .pipe(catchError(this.handleError<Plan[]>('getPlans')));
  }

  getPlanById(id: number): Observable<Plan> {
    return this.http
      .get<Plan>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError<Plan>('getPlanById')));
  }

  createPlan(plan: Plan): Observable<Plan> {
    return this.http
      .post<Plan>(this.apiUrl, plan)
      .pipe(catchError(this.handleError<Plan>('createPlan')));
  }

  updatePlan(plan: Plan): Observable<Plan> {
    return this.http
      .put<Plan>(`${this.apiUrl}/${plan.id}`, plan)
      .pipe(catchError(this.handleError<Plan>('updatePlan')));
  }

  deletePlan(id: number): Observable<void> {
    return this.http
      .delete<void>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError<void>('deletePlan')));
  }

  // // Error handling logic
  // private handleError(error: HttpErrorResponse) {
  //   console.error('API Error:', error);
  //   let message = 'Đã xảy ra lỗi, vui lòng thử lại sau.';
  //   if (error.error instanceof ErrorEvent) {
  //     message = `Lỗi client: ${error.error.message}`;
  //   } else {
  //     message = `Lỗi server: ${error.status} - ${error.message}`;
  //   }
  //   return throwError(() => new Error(message));
  // }
}
