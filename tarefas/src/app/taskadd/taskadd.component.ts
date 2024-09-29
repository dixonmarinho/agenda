import { Injectable, Inject, Component, NgModule, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ServiceAPI } from '../../services/service.api';
import { Task } from '../../Models/task';
import { HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-taskadd',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './taskadd.component.html',
  styleUrl: './taskadd.component.css' 
})

export class TaskaddComponent implements OnInit {
  titulo:string = "NOVO TITULO";
  descricao:string = "NOVA DESCRICAO";

  constructor(@Inject('TaskServiceAPI') private service: ServiceAPI<Task>) { }
 
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }


  close(){
    console.log('Fechando');
    
  }

}
