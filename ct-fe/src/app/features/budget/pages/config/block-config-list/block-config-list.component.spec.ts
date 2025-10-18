import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BlockConfigListComponent } from './block-config-list.component';

describe('BlockConfigListComponent', () => {
  let component: BlockConfigListComponent;
  let fixture: ComponentFixture<BlockConfigListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BlockConfigListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BlockConfigListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
