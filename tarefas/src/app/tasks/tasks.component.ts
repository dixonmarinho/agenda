import { Component, Inject } from '@angular/core';
import { CommonModule  } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { TaskaddComponent } from '../taskadd/taskadd.component';
import { ServiceAPI } from '../../services/service.api';
import { Task } from '../../Models/task';
import { MAT_AUTOCOMPLETE_SCROLL_STRATEGY_FACTORY_PROVIDER } from '@angular/material/autocomplete';

interface Dado {
  id: number;
  nome: string;
  valor: number;
}
@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './tasks.component.html',
  styleUrl: './tasks.component.css'
})

export class TasksComponent {
  dados: Dado[] = [
    { id: 1, nome: 'Produto A', valor: 10.99 },
    { id: 2, nome: 'Produto B', valor: 25.50 },
    { id: 3, nome: 'Produto C', valor: 5.75 },
    // ... adicione mais dados aqui
  ];

  constructor (public dialog : MatDialog, @Inject('TaskServiceAPI') private service: ServiceAPI<Task>) {
  }

  

  novo() {
    this.dialog.open(
       TaskaddComponent, 
       {
         width: '350px',
         height: '400px',
         position: { top: '0%', left: 'calc(50% - 250px)' }, // Centraliza e ajusta a posição
         disableClose: false,      
       }
     );
    
  }


  editar(id: number) {
    this.dialog.open(TaskaddComponent);
    // Lógica para editar o dado com o ID fornecido
    console.log(`Editar dado com ID: ${id}`);
  }

  excluir(id: number) {
    // Lógica para excluir o dado com o ID fornecido
    console.log(`Excluir dado com ID: ${id}`);
  }

}
