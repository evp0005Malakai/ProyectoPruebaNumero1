import { Routes } from '@angular/router';
import { LoginComponent } from './login/login';
import { BienvenidoComponent } from './bienvenido/bienvenido';

export const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'bienvenido', component: BienvenidoComponent },
];

