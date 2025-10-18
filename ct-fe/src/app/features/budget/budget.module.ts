import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BudgetRoutingModule } from './budget-routing.module';
import { BrowserModule } from '@angular/platform-browser';
import { PlanListComponent } from './pages/plan/plan-list/plan-list.component';
import { PlanEditComponent } from './pages/plan/plan-edit/plan-edit.component';
import { BlockTemplateListComponent } from './pages/config/block-template-list/block-template-list.component';
import { AccountingDetailComponent } from './pages/adjustment/accounting-detail/accounting-detail.component';
import { AccountingEditComponent } from './pages/adjustment/accounting-edit/accounting-edit.component';
import { PlanDetailComponent } from './pages/plan/plan-detail/plan-detail.component';
import { AccountingListComponent } from './pages/adjustment/accounting-list/accounting-list.component';
import { RequestFormDetailComponent } from './pages/adjustment/request-form-detail/request-form-detail.component';
import { RequestFormEditComponent } from './pages/adjustment/request-form-edit/request-form-edit.component';
import { RequestFormListComponent } from './pages/adjustment/request-form-list/request-form-list.component';
import { ProposedAdjustmentDetailComponent } from './pages/adjustment/proposed-adjustment-detail/proposed-adjustment-detail.component';
import { ProposedAdjustmentEditComponent } from './pages/adjustment/proposed-adjustment-edit/proposed-adjustment-edit.component';
import { ProposedAdjustmentListComponent } from './pages/adjustment/proposed-adjustment-list/proposed-adjustment-list.component';
import { BlockConfigListComponent } from './pages/config/block-config-list/block-config-list.component';

@NgModule({
  declarations: [
    PlanListComponent,
    PlanEditComponent,
    PlanDetailComponent,
    AccountingDetailComponent,
    AccountingEditComponent,
    AccountingListComponent,
    RequestFormDetailComponent,
    RequestFormEditComponent,
    RequestFormListComponent,
    ProposedAdjustmentDetailComponent,
    ProposedAdjustmentEditComponent,
    ProposedAdjustmentListComponent,

    BlockTemplateListComponent,
    BlockConfigListComponent,
  ],
  imports: [
    CommonModule,
    // BrowserModule,
    BudgetRoutingModule,
  ],
})
export class BudgetModule {}
