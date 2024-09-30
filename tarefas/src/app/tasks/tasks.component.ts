import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { TaskaddComponent } from '../taskadd/taskadd.component';
import { ServiceAPI, PaginatedResponse } from '../../services/service.api';
import { Task } from '../../Models/task';
import { Result } from '../../interfaces/Result';

@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './tasks.component.html',
  styleUrls: ['./tasks.component.css']
})
export class TasksComponent {
  dados: Task[] = [];

  paginatedData: Task[] = [];
  currentPage: number = 1;
  itemsPerPage: number = 3; // Número de itens por página
  totalPages: number = 0;

  constructor(public dialog: MatDialog, @Inject('TaskServiceAPI') private service: ServiceAPI<Task>) {
    this.refreshGrid();
  }

  refreshGrid() {
    this.service.list(this.currentPage, this.itemsPerPage)
      .subscribe((response: PaginatedResponse<Task>) => {
        this.totalPages = Math.ceil(response.totalPages / this.itemsPerPage); // total deve vir da sua resposta
        this.updatePaginatedData();
        const responseData = JSON.parse(JSON.stringify(response)) as Result<Task[]>;
        console.log(responseData.data);
        this.dados = responseData.data;
      });
  }

  updatePaginatedData() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    this.paginatedData = this.dados.slice(startIndex, startIndex + this.itemsPerPage);
  }

  novo() {
    this.dialog.open(
      TaskaddComponent, 
      {
        data:{
          service : this.service
        },
 
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

  nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
      this.updatePaginatedData();
    }
  }

  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updatePaginatedData();
    }
  }
}
