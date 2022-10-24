import { inject, injectable } from 'inversify';
import { TYPES } from '../../../Application/Controllers/types';
import { Employee } from '../../../Domain/Entities';
import { IEmployeeRepository, ISQLConnection } from '../../../Domain/Interfaces';

/**
 * Repository to get and save employee data from/into databases.
 */
@injectable()
export class EmployeeRepository implements IEmployeeRepository {
    private _sqlConnection: ISQLConnection;

    constructor(@inject(TYPES.ISQLConnection) SQLConnection: ISQLConnection) {
        this._sqlConnection = SQLConnection;
    }
    /**
     * Simple method to get employee data from a database.
     * @param document Employee document number.
     * @returns `Employee` object.
     */
    public async Get(document: string): Promise<Employee> {
        return await this._sqlConnection.executeStoredProcedure({
            document
        }, process.env.SP_GET);
    }
    /**
     * Simple method to insert employee into a database.
     * @param employee `Employee` object.
     * @returns boolean. `true` if successful.
     */
    public Save(employee: Employee): Promise<boolean> {
        return this._sqlConnection.executeStoredProcedure(employee, process.env.SP_SAVE);
    }
}