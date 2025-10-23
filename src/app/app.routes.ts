import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { BienvenidoComponent } from './bienvenido/bienvenido.component';
import { CalendarioComponent } from './calendario/calendario.component';
import { DashboardComponent } from './dashboard/dashboard.component';

export const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },  // 👉 abre primero el login
  { path: 'login', component: LoginComponent },           // login
  { path: 'bienvenido', component: BienvenidoComponent }, // después del login
  { path: 'inicio', component: CalendarioComponent },     // calendario
  { path: 'dashboard', component: DashboardComponent },   // dashboard
  { path: '**', redirectTo: 'login' }                     // rutas no válidas
];
