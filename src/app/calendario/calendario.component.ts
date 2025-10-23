import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

interface Dia {
  numero: number;
  actual: boolean; // si pertenece al mes actual
}

@Component({
  selector: 'app-calendario',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './calendario.component.html',
  styleUrls: ['./calendario.component.css']
})
export class CalendarioComponent {
  diasSemana = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];

  // Creamos los días de octubre 2025
  // Empezando desde el miércoles 1 de octubre
  calendario: Dia[] = [
    { numero: 29, actual: false }, { numero: 30, actual: false }, // días del mes anterior
    ...Array.from({ length: 31 }, (_, i) => ({ numero: i + 1, actual: true })),
    { numero: 1, actual: false }, { numero: 2, actual: false }, { numero: 3, actual: false }, { numero: 4, actual: false }, { numero: 5, actual: false }, { numero: 6, actual: false }, { numero: 7, actual: false }, { numero: 8, actual: false }, { numero: 9, actual: false } // días del mes siguiente
  ];

  // Duplicamos el calendario para el centro 2
  calendarioCentro1 = this.calendario;
  calendarioCentro2 = this.calendario;
}
