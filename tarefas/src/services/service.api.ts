import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

interface PaginatedResponse<T> {
    content: T[];
    totalElements: number;
    totalPages: number;
    size: number;
    number: number;
}

@Injectable({
    providedIn: 'root'
})

export class ServiceAPI<T> {

    constructor(private http: HttpClient, private endpoint: string) { }

    list(page: number, size: number): Observable<PaginatedResponse<T>> {
        let params = new HttpParams();
        params = params.append('page', page.toString());
        params = params.append('size', size.toString());
        return this.http.get<PaginatedResponse<T>>(`${this.endpoint}`, { params });
    }

    getById(id: number): Observable<T> {
        return this.http.get<T>(`${this.endpoint}/${id}`);
    }

    create(item: T): Observable<T> {
        return this.http.post<T>(`${this.endpoint}`, item);
    }

    update(id: 1  number, item: T): Observable<T> {
        return this.http.put<T>(`${this.endpoint}/${id}`, item);
    }

    delete(id: number): Observable<void> {
        return this.http.delete<void>(`${this.endpoint}/${id}`);
    }
}