import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Plan } from '../models/plan.model';

@Injectable({
  providedIn: 'root',
})
export class PlanService {
  private apiUrl = 'https://api.example.com/plans'; // Thay bằng URL thật của bạn

  constructor(private http: HttpClient) {}

  // Tính tổng amount từ detail và cập nhật vào plan.amount
  calculatePlanTotal(plan: Plan): Plan {
    const total = plan.details.reduce((sum, detail) => sum + detail.amount, 0);
    return {
      ...plan,
      amount: total,
    };
  }
  
  // GET all plans
  getPlans(): Observable<Plan[]> {
    return this.http
      .get<Plan[]>(this.apiUrl)
      .pipe(catchError(this.handleError));
  }

  // GET a plan by ID
  getPlanById(id: number): Observable<Plan> {
    return this.http
      .get<Plan>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError));
  }

  // POST a new plan
  createPlan(plan: Plan): Observable<Plan> {
    return this.http
      .post<Plan>(this.apiUrl, plan)
      .pipe(catchError(this.handleError));
  }

  // PUT to update an existing plan
  updatePlan(plan: Plan): Observable<Plan> {
    return this.http
      .put<Plan>(`${this.apiUrl}/${plan.id}`, plan)
      .pipe(catchError(this.handleError));
  }

  // DELETE a plan
  deletePlan(id: number): Observable<void> {
    return this.http
      .delete<void>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError));
  }

  // Error handling logic
  private handleError(error: HttpErrorResponse) {
    console.error('API Error:', error);
    let message = 'Đã xảy ra lỗi, vui lòng thử lại sau.';
    if (error.error instanceof ErrorEvent) {
      message = `Lỗi client: ${error.error.message}`;
    } else {
      message = `Lỗi server: ${error.status} - ${error.message}`;
    }
    return throwError(() => new Error(message));
  }
}
