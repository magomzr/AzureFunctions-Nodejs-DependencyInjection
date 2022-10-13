import { inject, injectable } from 'inversify';
import { TYPES } from '../../../Application/Controllers/types';
import { IEmployeeRepository } from "../../../Domain/Interfaces/IEmployeeRepository";
import { ISQLRepository } from "../../../Domain/Interfaces/ISQLRepository";

@injectable()
export class EmployeeRepository implements IEmployeeRepository {
    private _sqlRepository: ISQLRepository;

    constructor(@inject(TYPES.ISQLRepository) sqlRepository: ISQLRepository) {
        this._sqlRepository = sqlRepository;
    }

    public async Get(): Promise<any> {
        return await this._sqlRepository.executeStoredProcedure({}, process.env.SP_GET);
    }

    public Save(): boolean {
        return this._sqlRepository.saveMethod();
    }
}