import { ChangeDetectorRef, Component, Inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { TaskaddComponent } from '../taskadd/taskadd.component';
import { ServiceAPI, PaginatedResponse } from '../../services/service.api';
import { Task } from '../../Models/task';
import { Result } from '../../interfaces/Result';
import { ServiceDialog } from '../../services/service.dialog';

@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './tasks.component.html',
  styleUrls: ['./tasks.component.css']
})
export class TasksComponent implements OnInit {
  dados: Task[] = [];

  paginatedData: Task[] = [];
  currentPage: number = 1;
  itemsPerPage: number = 3; // Número de itens por página
  totalPages: number = 0;

  constructor(
    private cdr: ChangeDetectorRef,
    public dialog: MatDialog, 
    private dialogService: ServiceDialog,
    @Inject('TaskServiceAPI') private service: ServiceAPI<Task>) {
  }

  ngOnInit(): void {
    this.refreshGrid();
  }

  refreshGrid() {
    this.service.list(this.currentPage, this.itemsPerPage)
      .subscribe((response: PaginatedResponse<Task>) => {
        this.totalPages = Math.ceil(response.totalPages / this.itemsPerPage); // total deve vir da sua resposta
        const responseData = JSON.parse(JSON.stringify(response)) as Result<Task[]>;
        this.updatePaginatedData();
        this.dados = responseData.data;
        this.cdr.detectChanges();
      });
  }

  updatePaginatedData() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    this.paginatedData = this.dados.slice(startIndex, startIndex + this.itemsPerPage);
  }

  getStatus(status?:number): string
  {
    if (status == 1)
      return "Concluído";
    else
      return "Pendente";
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
    this.dialogService.showConfirmation('Confirmar a Exclusão ?', 'Esta ação não pode ser desfeita.')
      .then((confirmed) => {
        if (confirmed) {
          this.service.delete(id)
            .subscribe(
              (res) => {
                this.dialogService.showSuccess('Registro Excluido!');
                this.refreshGrid();
              },
              (error) => {
                this.dialogService.showSuccess('Erro ao excluir!');
              }
            );
        } else {
          this.dialogService.showWarning('Ação cancelada.');
        }
      });    
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
