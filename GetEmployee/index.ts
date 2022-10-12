import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { EmployeeService } from "../Application/Services/EmployeeService";
import { Employee } from "../Domain/Entities/Employee";
import { Result } from "../Domain/Entities/Result";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');
    const response: Result<Employee> = EmployeeService.Get();
    context.res = {
        // status: 200, /* Defaults to 200 */
        body: response
    };

};

export default httpTrigger;