import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CtLabelComponent } from './ct-label.component';

describe('CtLabelComponent', () => {
  let component: CtLabelComponent;
  let fixture: ComponentFixture<CtLabelComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CtLabelComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CtLabelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
