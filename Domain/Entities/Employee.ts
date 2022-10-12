import { Guid } from "guid-typescript";

export class Employee {
    constructor() {
        this.EmployeeId = Guid.create();
    }

    EmployeeId: Guid;
    DocumentTypeId: Guid;
    DocumentType: string;
    Document: string;
    FirstName: string;
    LastName: string;
    Age: number;
    Area: string;
    SubArea: string;
    SubAreaId: Guid;
}