import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RouterModule } from '@angular/router';
import { LoginComponent } from './login/login';
import { BienvenidoComponent } from './bienvenido/bienvenido';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterModule],
  template: `<router-outlet></router-outlet>`,
})
export class App {}
