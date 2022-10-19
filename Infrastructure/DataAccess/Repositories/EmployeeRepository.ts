import { inject, injectable } from 'inversify';
import { TYPES } from '../../../Application/Controllers/types';
import { Employee } from '../../../Domain/Entities/Employee';
import { IEmployeeRepository } from "../../../Domain/Interfaces/IEmployeeRepository";
import { ISQLConnection } from "../../../Domain/Interfaces/ISQLConnection";

@injectable()
export class EmployeeRepository implements IEmployeeRepository {
    private _sqlConnection: ISQLConnection;

    constructor(@inject(TYPES.ISQLConnection) SQLConnection: ISQLConnection) {
        this._sqlConnection = SQLConnection;
    }

    public async Get(document: string): Promise<Employee> {
        return await this._sqlConnection.executeStoredProcedure({
            document
        }, process.env.SP_GET);
    }

    public Save(employee: Employee): Promise<boolean> {
        return this._sqlConnection.executeStoredProcedure(employee, process.env.SP_SAVE);
    }
}