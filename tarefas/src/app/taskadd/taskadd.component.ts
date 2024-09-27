import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-taskadd',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './taskadd.component.html',
  styleUrl: './taskadd.component.css' 
})

export class TaskaddComponent {
  titulo:string = "NOVO TITULO";
  descricao:string = "NOVA DESCRICAO";

  close(){
    console.log('Fechando');
    
  }

}
