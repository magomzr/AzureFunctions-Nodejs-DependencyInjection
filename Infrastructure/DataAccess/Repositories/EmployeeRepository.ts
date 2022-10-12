import { Employee } from "../../../Domain/Entities/Employee";
import { IEmployeeRepository } from "../../../Domain/Interfaces/IEmployeeRepository";

export class EmployeeRepository implements IEmployeeRepository {
    Get(): Employee {
        return new Employee();
    }

    Save(): boolean {
        return true;
    }
}