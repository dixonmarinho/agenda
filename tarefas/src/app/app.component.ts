import { Component, Inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ServiceAPI } from '../services/service.api';
import { Task } from '../Models/task';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  providers: [
    { provide: 'TaskServiceAPI', useFactory: (http: HttpClient) => new ServiceAPI<Task>(http, 'tasks'), deps: [HttpClient] },
  ]
})

export class AppComponent {
  title = 'Gerenciador de Tarefas';
  constructor(@Inject('TaskServiceAPI') private service: ServiceAPI<Task>) { }
}
