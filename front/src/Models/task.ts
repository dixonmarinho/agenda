export interface Task {
    id: number,
    titulo: string,
    descricao: string,
    data?: Date,
    status?: number
}

export type Tasks = Task[];
