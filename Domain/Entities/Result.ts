export class Result<T> {
    constructor(options?: {Message?: string, Success?: boolean, Data?: T}) {
        this.Message = options.Message || "Successful request";
        this.Success = options.Success || false;
        this.Data = options.Data || null;
    }

    Message: string;
    Success: boolean;
    Data?: T;
}