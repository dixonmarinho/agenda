import { Component, Inject } from '@angular/core';
import { CommonModule  } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { TaskaddComponent } from '../taskadd/taskadd.component';
import { ServiceAPI, PaginatedResponse } from '../../services/service.api';
import { Task } from '../../Models/task';
import { Result } from '../../interfaces/Result';
import { MAT_AUTOCOMPLETE_SCROLL_STRATEGY_FACTORY_PROVIDER } from '@angular/material/autocomplete';


@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './tasks.component.html',
  styleUrl: './tasks.component.css'
})

export class TasksComponent {
  //dados: Task[] = [{ id: 1, titulo: 'Produto A', descricao: 'AA' }];
  dados: Task[] = [];

  constructor (public dialog : MatDialog, @Inject('TaskServiceAPI') private service: ServiceAPI<Task>) {
  }
 
  refreshGrid(){
    this.service.list(1, 3)
    .subscribe((paginationresponse : Result<Task>) => {
      console.log(paginationresponse.data)
      this.dados = paginationresponse.data;
    });
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
