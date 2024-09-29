import { Routes } from '@angular/router';
import { TasksComponent } from './tasks/tasks.component';
import { LoginComponent } from './login/login.component';
import { TaskaddComponent } from './taskadd/taskadd.component';

export const routes: Routes = [
    {path : 'A', component: TasksComponent},
    {path : '', component: TaskaddComponent},
];
