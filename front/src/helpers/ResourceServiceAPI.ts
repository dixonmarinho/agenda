import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { ResourceModel } from '../models/ResourceModel';
import { environment } from '../environments/environment.development';

export abstract class ResourceServiceAPI<T extends ResourceModel<T>> {
  protected  apiUrl: string;
  constructor(
    private httpClient: HttpClient,
    private tConstructor: { new (m: Partial<T>, ...args: unknown[]): T },
    protected endpoint: string
  ) 
  {
    // get by envoriment
    this.apiUrl = environment.apiUrl + endpoint;
  }

  public create(resource: Partial<T> & { toJson: () => T }): Observable<T> {
    return this.httpClient
      .post<T>(`${this.apiUrl}`, resource.toJson())
      .pipe(map((result) => new this.tConstructor(result)));
  }

  
  // Pagination
  public getPaginated(page: number, limit: number): Observable<T[]> {
    return this.httpClient
      .get<T[]>(`${this.apiUrl}?_page=${page}&_limit=${limit}`)
      .pipe(map((result) => result.map((i) => new this.tConstructor(i))));
  }


  public get(): Observable<T[]> {
    return this.httpClient
      .get<T[]>(`${this.apiUrl}`)
      .pipe(map((result) => result.map((i) => new this.tConstructor(i))));
  }

  public getById(id: number): Observable<T> {
    return this.httpClient
      .get<T>(`${this.apiUrl}/${id}`)
      .pipe(map((result) => new this.tConstructor(result)));
  }

  public update(resource: Partial<T> & { toJson: () => T }): Observable<T> {
    return this.httpClient
      .put<T>(`${this.apiUrl}/${resource.id}`, resource.toJson())
      .pipe(map((result) => new this.tConstructor(result)));
  }

  public delete(id: number): Observable<void> {
    return this.httpClient.delete<void>(`${this.apiUrl}/${id}`);
  }
}