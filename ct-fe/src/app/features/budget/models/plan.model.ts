import { PlanDetail } from './plan-detail.model';

export interface Plan {
  id: number;
  name: string;
  amount: number; // Tổng tiền, được tính từ details
  details: PlanDetail[];
}
