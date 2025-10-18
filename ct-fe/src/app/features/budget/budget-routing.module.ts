import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';   
import { PlanListComponent } from './pages/plan/plan-list/plan-list.component';
import { PlanDetailComponent } from './pages/plan/plan-detail/plan-detail.component';
import { PlanEditComponent } from './pages/plan/plan-edit/plan-edit.component';
import { ProposedAdjustmentListComponent } from './pages/adjustment/proposed-adjustment-list/proposed-adjustment-list.component';
import { ProposedAdjustmentEditComponent } from './pages/adjustment/proposed-adjustment-edit/proposed-adjustment-edit.component';
import { ProposedAdjustmentDetailComponent } from './pages/adjustment/proposed-adjustment-detail/proposed-adjustment-detail.component';
import { RequestFormListComponent } from './pages/adjustment/request-form-list/request-form-list.component';
import { RequestFormDetailComponent } from './pages/adjustment/request-form-detail/request-form-detail.component';
import { RequestFormEditComponent } from './pages/adjustment/request-form-edit/request-form-edit.component';
import { AccountingListComponent } from './pages/adjustment/accounting-list/accounting-list.component';
import { AccountingDetailComponent } from './pages/adjustment/accounting-detail/accounting-detail.component';
import { AccountingEditComponent } from './pages/adjustment/accounting-edit/accounting-edit.component';
import { BlockTemplateListComponent } from './pages/config/block-template-list/block-template-list.component';
import { BlockConfigListComponent } from './pages/config/block-config-list/block-config-list.component';

const routes: Routes = [
  {
    path: 'plan',
    children: [
      {
        path: '',
        component: PlanListComponent,
      },
      {
        path: 'detail',
        component: PlanDetailComponent,
      },
      {
        path: 'edit',
        component: PlanEditComponent,
      },
    ],
  },
  {
    path: 'config',
    children: [ 
      {
        path: 'block',
        component: BlockConfigListComponent,
      },
      {
        path: 'template',
        component: BlockTemplateListComponent,
      },
    ],
  },
  {
    path: 'adjustment/propose',

    children: [
      {
        path: '',
        component: ProposedAdjustmentListComponent,
      },
      {
        path: 'detail',
        component: ProposedAdjustmentDetailComponent,
      },
      {
        path: 'edit',
        component: ProposedAdjustmentEditComponent,
      },
    ],
  },
  {
    path: 'adjustment/request',

    children: [
      {
        path: '',
        component: RequestFormListComponent,
      },
      {
        path: 'detail',
        component: RequestFormDetailComponent,
      },
      {
        path: 'edit',
        component: RequestFormEditComponent,
      },
    ],
  },
  {
    path: 'adjustment/accounting',

    children: [
      {
        path: '',
        component: AccountingListComponent,
      },
      {
        path: 'detail',
        component: AccountingDetailComponent,
      },
      {
        path: 'edit',
        component: AccountingEditComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BudgetRoutingModule { }
