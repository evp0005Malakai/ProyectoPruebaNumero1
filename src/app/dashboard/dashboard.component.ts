import { Component } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { SidebarComponent } from '../sidebar/sidebar.component';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [HeaderComponent, SidebarComponent, CommonModule, RouterModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
})
export class DashboardComponent {
  sidebarCollapsed = false;

  toggleSidebar() {
    this.sidebarCollapsed = !this.sidebarCollapsed;
  }
}
