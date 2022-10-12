import { Employee } from "../../Domain/Entities/Employee";
import { Result } from "../../Domain/Entities/Result";
import { EmployeeRepository } from "../../Infrastructure/DataAccess/Repositories/EmployeeRepository";

export class EmployeeService {
    private _employeeRepository: EmployeeRepository;
    constructor(employeeRepository: EmployeeRepository) {
        this._employeeRepository = employeeRepository
    }

    /**
     * Get Employee method. This will return an Employee as data in the defined Result DTO either if request is succesful or not.
     */
    public static Get(): Result<Employee> {
        const _employeeRepository = new EmployeeRepository();
        try {
            const response = _employeeRepository.Get();
            return new Result<Employee>({
                Success: true,
                Data: response
            });
        } catch (error) {

            return new Result<Employee>({
                Message: error
            });
        }
    }

    /**
     * Save Employee method. This will return a boolean as data in the defined Result DTO either if request is succesful or not.
     */
    public static Save(): Result<boolean> {
        const _employeeRepository = new EmployeeRepository();
        try {
            const response = _employeeRepository.Save();
            return new Result<boolean>({
                Success: true,
                Data: response
            });
        } catch (error) {

            return new Result<boolean>({
                Message: error
            });
        }
    }
}