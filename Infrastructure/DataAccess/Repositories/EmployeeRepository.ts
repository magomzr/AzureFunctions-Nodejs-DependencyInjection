import { Employee } from "../../../Domain/Entities/Employee";
import { IEmployeeRepository } from "../../../Domain/Interfaces/IEmployeeRepository";
import { ISQLRepository } from "../../../Domain/Interfaces/ISQLRepository";
import { SQLRepository } from "../Databases/SQLRepository";

export class EmployeeRepository implements IEmployeeRepository {
    private readonly _sqlRepository: ISQLRepository;
    
    constructor(sqlRepository: ISQLRepository) {
        this._sqlRepository = sqlRepository;
    }

    static async Get(): Promise<any> {
        const sqlRepository: SQLRepository = new SQLRepository();
        const result = await sqlRepository.executeStoredProcedure({}, process.env.SP_GET);
        return result;
    }

    static Save(): boolean {
        return true;
    }
}