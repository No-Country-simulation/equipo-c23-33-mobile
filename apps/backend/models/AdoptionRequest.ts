export interface IAdoptionRequest {
    id_request?: string;
    id_pet: string;
    id_user: string;
    status: 'Pending' | 'Approved' | 'Rejected';
    message: string;
    createdAt: Date;
}

export class AdoptionRequest {
    id_request?: string;
    id_pet: string;
    id_user: string;
    status: 'Pending' | 'Approved' | 'Rejected';
    message: string;
    createdAt: Date;

    constructor(data: IAdoptionRequest) {
        this.id_request = data.id_request;
        this.id_pet = data.id_pet;
        this.id_user = data.id_user;
        this.status = data.status || 'Pending';
        this.message = data.message;
        this.createdAt = data.createdAt ?? new Date();
    }

    toFirestore(): Omit<IAdoptionRequest, 'id_request'> {
        return {
            id_pet: this.id_pet,
            id_user: this.id_user,
            status: this.status,
            message: this.message,
            createdAt: this.createdAt,
        };
    }
}
