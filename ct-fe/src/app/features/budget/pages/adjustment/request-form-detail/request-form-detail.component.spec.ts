import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RequestFormDetailComponent } from './request-form-detail.component';

describe('RequestFormDetailComponent', () => {
  let component: RequestFormDetailComponent;
  let fixture: ComponentFixture<RequestFormDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RequestFormDetailComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RequestFormDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
