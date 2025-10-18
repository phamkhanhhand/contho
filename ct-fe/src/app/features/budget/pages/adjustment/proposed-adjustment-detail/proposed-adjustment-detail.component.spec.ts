import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProposedAdjustmentDetailComponent } from './proposed-adjustment-detail.component';

describe('ProposedAdjustmentDetailComponent', () => {
  let component: ProposedAdjustmentDetailComponent;
  let fixture: ComponentFixture<ProposedAdjustmentDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProposedAdjustmentDetailComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProposedAdjustmentDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
