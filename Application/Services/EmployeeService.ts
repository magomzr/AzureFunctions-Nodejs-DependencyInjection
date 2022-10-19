import { inject, injectable } from "inversify";
import { Employee, Result } from "../../Domain/Entities";
import { IEmployeeRepository, IServiceBusFunction } from "../../Domain/Interfaces";
import { TYPES } from "../Controllers/types";

@injectable()
export class EmployeeService {
    private _employeeRepository: IEmployeeRepository;
    private _sbFunction: IServiceBusFunction;
    constructor(
        @inject(TYPES.IEmployeeRepository) employeeRepository: IEmployeeRepository,
        @inject(TYPES.IServiceBusFunction) sbFunction: IServiceBusFunction
    ) {
        this._employeeRepository = employeeRepository;
        this._sbFunction = sbFunction;
    }

    /**
     * Get Employee method. This will return an Employee as data in the defined Result DTO either if request is succesful or not.
     */
    public async Get(document: string): Promise<Result<Employee>> {
        try {
            const response: Employee = await this._employeeRepository.Get(document);
            // await this._sbFunction.SendMessageToQueue('test', 'useraction');
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