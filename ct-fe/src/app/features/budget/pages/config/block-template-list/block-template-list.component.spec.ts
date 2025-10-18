import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BlockTemplateListComponent } from './block-template-list.component';

describe('BlockTemplateListComponent', () => {
  let component: BlockTemplateListComponent;
  let fixture: ComponentFixture<BlockTemplateListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BlockTemplateListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BlockTemplateListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
