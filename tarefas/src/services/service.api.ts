import { Injectable, Inject, NgModule } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from "../environments/environment";
import { Result } from '../interfaces/Result';


export interface PaginatedResponse<T> {
    content: Result<T>;
    totalElements: number;
    totalPages: number;
    size: number;
    number: number;
}

@Injectable({
    providedIn: 'root'
})

export class ServiceAPI<T> {
    private urlapi: string;
    constructor(private http: HttpClient, @Inject(String) private endpoint: string) { 
        this.urlapi = `${environment.baseurl}/${endpoint}`;
    }

    list(page: number, size: number): Observable<Result<T>> {
        let params = new HttpParams();
        params = params.append('page', page.toString());
        params = params.append('pagesize', size.toString());
        //return this.http.get<PaginatedResponse<T>>(`${this.urlapi}/List`, { params });
        return this.http.get<Result<T>>(`${this.urlapi}/List`, { params });
    }

    getById(id: number): Observable<T> {
        return this.http.get<T>(`${this.urlapi}/${id}`);
    }

    create(item: T): Observable<T> {
        return this.http.post<T>(`${this.urlapi}`, item);
    }

    update(id: number, item: T): Observable<T> {
        return this.http.put<T>(`${this.urlapi}/${id}`, item);
    }

    delete(id: number): Observable<void> {
        return this.http.delete<void>(`${this.urlapi}/${id}`);
    }
}