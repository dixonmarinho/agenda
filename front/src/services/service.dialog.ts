import { Injectable } from '@angular/core';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root',
})

export class ServiceDialog  {
  showSuccess(message: string) {
    Swal.fire({
      icon: 'success',
      title: 'Sucesso!',
      text: message,
    });
  }

  showError(message: string) {
    Swal.fire({
      icon: 'error',
      title: 'Erro!',
      text: message,
    });
  }

  showWarning(message: string) {
    Swal.fire({
      icon: 'warning',
      title: 'Atenção!',
      text: message,
    });
  }

  showConfirmation(title: string, text: string): Promise<boolean> {
    return Swal.fire({
      title: title,
      text: text,
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Sim',
      cancelButtonText: 'Não',
    }).then((result) => {
      return result.isConfirmed; // Retorna true se o usuário clicar em "Sim"
    });
  }
  
}
