import { inject, injectable } from 'inversify';
import { TYPES } from '../../../Application/Controllers/types';
import { Employee } from '../../../Domain/Entities/Employee';
import { IEmployeeRepository } from "../../../Domain/Interfaces/IEmployeeRepository";
import { ISQLRepository } from "../../../Domain/Interfaces/ISQLRepository";

@injectable()
export class EmployeeRepository implements IEmployeeRepository {
    private _sqlRepository: ISQLRepository;

    constructor(@inject(TYPES.ISQLRepository) sqlRepository: ISQLRepository) {
        this._sqlRepository = sqlRepository;
    }

    public async Get(document: string): Promise<Employee> {
        return await this._sqlRepository.executeStoredProcedure({
            document
        }, process.env.SP_GET);
    }

    public Save(employee: Employee): Promise<boolean> {
        return this._sqlRepository.executeStoredProcedure(employee, process.env.SP_SAVE);
    }
}