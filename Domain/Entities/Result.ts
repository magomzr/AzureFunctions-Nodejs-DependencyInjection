export class Result<T> {
    constructor({Message = "Successful request", Success = false, Data = null}: {Message?: string, Success?: boolean, Data?: T}) {
        this.Message = Message;
        this.Success = Success;
        this.Data = Data;
    }

    Message: string;
    Success: boolean;
    Data?: T;
}