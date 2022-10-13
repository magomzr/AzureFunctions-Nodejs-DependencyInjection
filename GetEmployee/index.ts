import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { StartupBuilder } from "../Application/Controllers/inversify.config";
import { EmployeeService } from "../Application/Services/EmployeeService";
import { Employee } from "../Domain/Entities/Employee";
import { Result } from "../Domain/Entities/Result";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');

    const _employeeService = StartupBuilder.resolve(EmployeeService);
    const response: Result<Employee> = await _employeeService.Get();
    context.res = {
        // status: 200, /* Defaults to 200 */
        body: response
    };

};

export default httpTrigger;