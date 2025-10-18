import { Component, OnInit } from '@angular/core';
import { Plan } from '../../../models/plan.model';
import { PlanService } from '../../../services/plan.service';
import { PlanDetail } from '../../../models/plan-detail.model'; 
@Component({
  selector: 'app-plan-list', 
  templateUrl: './plan-list.component.html',
  styleUrl: './plan-list.component.scss',
})
export class PlanListComponent {
  plan!: Plan;

  constructor(private planService: PlanService) {}

  ngOnInit(): void {
    // Giả lập dữ liệu
    const details: PlanDetail[] = [
      { id: 1, description: 'Detail 1', amount: 100 },
      { id: 2, description: 'Detail 2', amount: 200 },
      { id: 3, description: 'Detail 3', amount: 50 },
    ];

    const rawPlan: Plan = {
      id: 1,
      name: 'Master Plan',
      amount: 0, // sẽ được tính lại
      details: details,
    };

    this.plan = this.planService.calculatePlanTotal(rawPlan);
  }
}
