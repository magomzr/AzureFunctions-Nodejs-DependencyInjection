import { Employee } from "../Entities/Employee";

export interface IEmployeeRepository {
    Get(): Employee;
    Save(): boolean;
}