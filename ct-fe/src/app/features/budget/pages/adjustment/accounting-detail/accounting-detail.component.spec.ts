import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AccountingDetailComponent } from './accounting-detail.component';

describe('AccountingDetailComponent', () => {
  let component: AccountingDetailComponent;
  let fixture: ComponentFixture<AccountingDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AccountingDetailComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AccountingDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
