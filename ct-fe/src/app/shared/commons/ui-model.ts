import { EntityState } from './enum';

import { InjectionToken, TemplateRef } from '@angular/core';
 
export const CTBaseTableToken = new InjectionToken<any>('CTBaseTableToken');

export interface CTTableColumn {
  field: string;
  header?: string;
  visible?: boolean;
  minWidth?: string;

  tdTemp?: TemplateRef<any>;
}

export interface CTAttachment {
  fileName?: string;
  attachmentID?: string;
  createdDate?: Date;
  createdBy?: string;
  file?: any;
  fileContent?: {
    fileType?: string;
    base64?: string;
  };

  refID?: string;
  refType?: number;
  entityState?: EntityState; //trang thai them sua xoa
  ECMID?: string;

  uiid?: string;
}
