import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CtTextboxComponent } from './ct-textbox.component';

describe('CtTextboxComponent', () => {
  let component: CtTextboxComponent;
  let fixture: ComponentFixture<CtTextboxComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CtTextboxComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CtTextboxComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
