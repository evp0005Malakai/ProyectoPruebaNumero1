import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username = '';
  password = '';
  error = false;

  constructor(private router: Router) {}

  login() {
    console.log('Intentando iniciar sesión...', this.username, this.password);
    if (this.username === 'admin' && this.password === '1234') {
      this.error = false;
      this.router.navigate(['/bienvenido'], { queryParams: { user: this.username } });
    } else {
      this.error = true;
      console.log('Credenciales incorrectas');
    }
  }
}


