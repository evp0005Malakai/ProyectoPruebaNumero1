import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-bienvenido',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './bienvenido.component.html',
  styleUrls: ['./bienvenido.component.css']
})
export class BienvenidoComponent {
  username = 'usuario';

  constructor(private route: ActivatedRoute) {
    this.route.queryParams.subscribe(params => {
      if (params['user']) {
        this.username = params['user'];
      }
    });
  }
}


