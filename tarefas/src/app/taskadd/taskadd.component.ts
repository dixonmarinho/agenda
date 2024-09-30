import { Injectable, Inject, Component, NgModule, OnInit } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { ServiceAPI } from '../../services/service.api';
import { Task } from '../../Models/task';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { ServiceDialog } from '../../services/service.dialog';

@Component({
  selector: 'app-taskadd',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './taskadd.component.html',
  styleUrl: './taskadd.component.css' 
})

export class TaskaddComponent implements OnInit {
  titulo:string = "NOVO TAREFA";
  descricao:string = "DESCRICAO DA TAREFA";

  constructor(
    @Inject('TaskServiceAPI') private service: ServiceAPI<Task>,
    private dialog: ServiceDialog
  ) { }
 
  ngOnInit(): void { }

  add(){

    this.dialog.showConfirmation('Adicionar essa tarefa ?', 'Esta ação não pode ser desfeita.')
      .then((confirmed) => {
        if (confirmed) {

          const data: Task = {id: 0, titulo: this.titulo, descricao:  this.descricao};
          this.service.create(data)
          .subscribe(
            (res) => {
              console.log(res);
            },
            (error) => {
              console.log(error);
            }
          );    
      
          this.dialog.showSuccess('Ação confirmada!');
        } else {
          this.dialog.showWarning('Ação cancelada.');
        }
      });
  }

  close(){
    console.log('Fechando');
    
  }

}
