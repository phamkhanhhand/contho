import { APP_INITIALIZER, NgModule } from '@angular/core'; 
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component'; 
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';
import { CommonModule, registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
//import { BrowserAnimationsModule } from '@angular/platform-browser/animations'; 
import { RouterModule } from '@angular/router'; 
import { LoginComponent } from './shell/login/login.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
  
// import { HttpClientModule } from '@angular/common/http';
registerLocaleData(en);
 
 
@NgModule({
  declarations: [AppComponent, LoginComponent],
  bootstrap: [AppComponent],
  imports: [
    // HttpClientModule,
    CommonModule,
    BrowserAnimationsModule,
    FormsModule, 
    AppRoutingModule,
    RouterModule,
  ],
  providers: [
    { provide: NZ_I18N, useValue: en_US },
    provideHttpClient(withInterceptorsFromDi()),
  ],
})
export class AppModule {}
