import { inject, injectable } from "inversify";
import { Employee } from "../../Domain/Entities/Employee";
import { Result } from "../../Domain/Entities/Result";
import { IEmployeeRepository } from "../../Domain/Interfaces/IEmployeeRepository";
import { TYPES } from "../Controllers/types";

@injectable()
export class EmployeeService {
    private _employeeRepository: IEmployeeRepository;
    constructor(@inject(TYPES.IEmployeeRepository) employeeRepository: IEmployeeRepository) {
        this._employeeRepository = employeeRepository;
    }

    /**
     * Get Employee method. This will return an Employee as data in the defined Result DTO either if request is succesful or not.
     */
    public async Get(document: string): Promise<Result<Employee>> {
        try {
            const response: Employee = await this._employeeRepository.Get(document);
            return new Result<Employee>({
                Success: true,
                Data: response
            });
        } catch (error) {

            return new Result<Employee>({
                Message: `${error}`
            });
        }
    }

    /**
     * Save Employee method. This will return a boolean as data in the defined Result DTO either if request is succesful or not.
     */
    public async Save(employee: Employee): Promise<Result<boolean>> {
        try {
            const response: boolean = await this._employeeRepository.Save(employee);
            return new Result<boolean>({
                Success: true,
                Data: response
            });
        } catch (error) {
            return new Result<boolean>({
                Message: `${error}`
            });
        }
    }
}