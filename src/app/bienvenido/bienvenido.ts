import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-bienvenido',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './bienvenido.html',
  styleUrls: ['./bienvenido.css']
})
export class BienvenidoComponent {
  username = '';

  constructor(private route: ActivatedRoute) {
    this.route.queryParams.subscribe(params => {
      this.username = params['user'] || 'usuario';
    });
  }
}

