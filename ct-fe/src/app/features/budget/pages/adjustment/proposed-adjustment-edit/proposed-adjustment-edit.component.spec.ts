import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProposedAdjustmentEditComponent } from './proposed-adjustment-edit.component';

describe('ProposedAdjustmentEditComponent', () => {
  let component: ProposedAdjustmentEditComponent;
  let fixture: ComponentFixture<ProposedAdjustmentEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProposedAdjustmentEditComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProposedAdjustmentEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
