import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RequestFormEditComponent } from './request-form-edit.component';

describe('RequestFormEditComponent', () => {
  let component: RequestFormEditComponent;
  let fixture: ComponentFixture<RequestFormEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RequestFormEditComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RequestFormEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
