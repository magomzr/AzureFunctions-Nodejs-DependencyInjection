import { Employee } from "../Entities/Employee";

export interface IEmployeeRepository {
    Get(document: string): Promise<Employee>;
    Save(employee: Employee): Promise<boolean>;
}