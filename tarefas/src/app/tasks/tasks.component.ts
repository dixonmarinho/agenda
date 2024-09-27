import { Component } from '@angular/core';
import { CommonModule  } from '@angular/common';

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

  editar(id: number) {
    // Lógica para editar o dado com o ID fornecido
    console.log(`Editar dado com ID: ${id}`);
  }

  excluir(id: number) {
    // Lógica para excluir o dado com o ID fornecido
    console.log(`Excluir dado com ID: ${id}`);
  }

}
