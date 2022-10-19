import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { StartupBuilder } from "../Application/Controllers/inversify.config";
import { EmployeeService } from "../Application/Services/EmployeeService";
import { Employee, Result } from "../Domain/Entities";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');

    const _employeeService = StartupBuilder.resolve(EmployeeService);
    const document: string = req.body.document;
    const response: Result<Employee> = await _employeeService.Get(document);

    context.res = {
        body: response
    };

};

export default httpTrigger;