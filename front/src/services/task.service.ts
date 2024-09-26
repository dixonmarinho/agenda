import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Tasks } from '../models/TaskModel';
import { ResourceService } from '../helpers/ResourceServiceAPI';

@Injectable({ providedIn: 'root' })
export class UsersService extends ResourceService<Tasks> {
  constructor(private http: HttpClient) {
    super(http, Tasks, 'tasks');
  }
}