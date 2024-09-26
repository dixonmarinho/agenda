import { Routes } from '@angular/router';
import { TarefasComponent } from './tarefas/tarefas.component';
import { LoginComponent } from './login/login.component';

export const routes: Routes = [
    { path: 'tasks', title: 'Tarefas', component: TarefasComponent },
    { path: 'login', title: 'Login', component: LoginComponent } 
];
