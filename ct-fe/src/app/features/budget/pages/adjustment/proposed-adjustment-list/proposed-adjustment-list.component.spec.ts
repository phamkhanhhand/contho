import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProposedAdjustmentListComponent } from './proposed-adjustment-list.component';

describe('ProposedAdjustmentListComponent', () => {
  let component: ProposedAdjustmentListComponent;
  let fixture: ComponentFixture<ProposedAdjustmentListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProposedAdjustmentListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProposedAdjustmentListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
