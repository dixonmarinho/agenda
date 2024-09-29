import { Injectable, Inject, Component, NgModule, OnInit } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { ServiceAPI } from '../../services/service.api';
import { Task } from '../../Models/task';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';

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

  constructor(@Inject('TaskServiceAPI') private service: ServiceAPI<Task>) { }
 
  ngOnInit(): void { }

  add(){
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
  }

  close(){
    console.log('Fechando');
    
  }

}
