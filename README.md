<h1 align="center">TypeScript Azure Function App template</h1>
<p align="center">A DDD serverless function template developed in TypeScript with dependency injection. Using MSSQL and InversifyJS.</p>

## About
With the goal of using SOLID principles, this code uses the Dependency Injection design pattern in a Domain-Driven Design architecture or DDD project. Through an IOC container and by using the InversifyJS module, this code is able to:

1. Inject dependencies into different objects.
2. Execute a stored procedure with the Microsoft SQL Server Node.js client.
3. Return results through a DTO standard.
4. Get and save information from a database through stored procedures.
5. Be deployed to production in a Function App in Microsoft Azure.

## Folder structure
Unlike C# and .NET projects, the initialization files of each Function App must be one level above the package.json. It is recommended to use the folder structure [recommended by Microsoft](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-node), as shown below:

    FunctionsProject
    ├── MyFirstFunction
    │   ├── index.ts
    │   └── function.json
    ├── MySecondFunction
    │   ├── index.ts
    │   └── function.json
    ├── SharedCode
    │   ├── myFirstHelperFunction.ts
    │   └── mySecondHelperFunction.json
    ├── node_modules/
    ├── host.json
    ├── package.json
    └── ...

Having said that and using a DDD architecture, it is suggested to use the following folder structure:

    FunctionsProject
    ├── MyFirstFunction
    │   ├── index.ts
    │   └── function.json
    ├── MySecondFunction
    │   ├── index.ts
    │   └── function.json
    ├── Application
    │   ├── Controllers
    │   │   ├── inverisify.config.ts
    │   │   └── types.ts
    │   ├── Services
    │   │   ├── EmployeeService.ts
    │   │   ├── ChatbotService.ts
    │   │   └── ...
    ├── Domain
    │   ├── Entities
    │   │   ├── Result.ts
    │   │   ├── UserRequest.ts
    │   │   └── ...
    │   ├── Interfaces
    │   │   ├── ISQLConnection.ts
    │   │   ├── IEmployeeRepository.ts
    │   │   └── ...
    ├── Infrastructure
    │   ├── CrossCutting
    │   │   ├── Clients
    │   │   │   ├── ServiceBusClient.ts
    │   │   │   ├── DialogflowCXClient.ts
    │   │   │   └── ...
    │   │   ├── Functions
    │   │   │   ├── DialogflowCXFunction.ts
    │   │   │   ├── ServiceBusFunction.ts
    │   │   │   └── ...
    │   │   ├── Helpers
    │   │   │   ├── AESEncryption.ts
    │   │   │   └── ...
    │   ├── DataAccess
    │   │   ├── Databases
    │   │   │   └── SQLConnection.ts
    │   ├── ├── Repositories
    │   │   │   ├── EmployeeRepository.ts
    │   │   │   ├── ChatbotRepository.ts
    │   └── └── └── ...
    ├── node_modules/
    ├── host.json
    ├── tsconfig.json
    ├── package.json
    └── ...
## Project configuration
We proceed to install the `inversify` and `reflect-metadata` packages as devDependencies:
```sh
> npm install inversify reflect-metadata --save
```
Before proceeding, we must use the following settings in the `tsconfig.json` file. The `experimentalDecorators`, `emitDecoratorMetadata`, `types` and `lib` properties must be configured as follows.
```json
{
    "compilerOptions": {
        "target": "es5",
        "lib": ["es6"],
        "types": ["reflect-metadata"],
        "module": "commonjs",
        "moduleResolution": "node",
        "experimentalDecorators": true,
        "emitDecoratorMetadata": true
    }
}
```

## Steps to inject dependencies
To implement this design pattern, we must start with the creation of any interface.
```ts
// Domain/Interfaces/IEmployeeRepository.ts

import { Employee } from "../Entities/Employee";

export interface IEmployeeRepository {
    Get(document: string): Promise<Employee>;
    Save(employee: Employee): Promise<boolean>;
}
```

Dependency injection needs to set the defined types as identifiers per run. Symbols are used for this. This way we make sure that the type is unique throughout the code, like a token, and all injected classes get this same identifier. For each interface, we must have a record here.

```ts
// Application/Controllers/types.ts

export const TYPES = {
    ISQLConnection: Symbol.for("ISQLConnection"),
    IEmployeeRepository: Symbol.for("IEmployeeRepository"),
    ...
};
```
Now we will create the classes of our services, repositories and other files needed for our project. We will use the `@injectable()` & `@inject` decorators to communicate with the whole project from our IoC container.

We will use `@inject` in the constructor to inject the dependencies where we need them.
```ts
...
export class EmployeeRepository implements IEmployeeRepository {
    private _sqlConnection: ISQLConnection;
    constructor(@inject(TYPES.ISQLConnection) SQLConnection: ISQLConnection) {
        this._sqlConnection = SQLConnection;
    }
    ...
```
On the other hand, any class used as a provider in the IoC container will have `@injectable()`.
```ts
...
@injectable()
export class EmployeeRepository implements IEmployeeRepository {
...
```

## The IoC Container
Similar to C# `Startup.cs`, this container is where we will have the injection logic. The file should be named `inversify.config.ts` as suggested by the module.

```ts
// Application/Controllers/inversify.config.ts

import 'reflect-metadata'; // This is the only place where 'reflect-metadata' should be imported and it should be only once in the whole project.
import { Container } from 'inversify';
import { IEmployeeRepository } from '../../Domain/Interfaces/IEmployeeRepository';
import { ISQLConnection } from '../../Domain/Interfaces/ISQLConnection';
import { SQLConnection } from '../../Infrastructure/DataAccess/Databases/SQLConnection';
import { EmployeeRepository } from '../../Infrastructure/DataAccess/Repositories/EmployeeRepository';
import { EmployeeService } from '../Services/EmployeeService';
import { TYPES } from './types';

const StartupBuilder = new Container();

StartupBuilder.bind<ISQLConnection>(TYPES.ISQLConnection).to(SQLConnection).inTransientScope();
StartupBuilder.bind<IEmployeeRepository>(TYPES.IEmployeeRepository).to(EmployeeRepository).inSingletonScope();
StartupBuilder.bind(EmployeeService).toSelf().inSingletonScope(); // Without interface.

// StartupBuilder.bind<IOurInterface>(TYPES.OurInterfaceType).to(ClassProviderToInterface).inSingleton/Transient/.../Scope();

export { StartupBuilder };
```

## Resolve dependencies
Now, in the composition root, or in the most external part of our whole project (in this case, where we will have the logic of the endpoints of the Azure Function Apps), we must resolve the dependencies so that the whole IoC container is activated.
You can use the method `.get<T>(...)` from the `Container` class to resolve a dependency if it has an interface or `.resolve(...)` if not. Normally these files do not use interfaces.

```ts
// GetEmployee/index.ts

import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { StartupBuilder } from "../Application/Controllers/inversify.config";
import { EmployeeService } from "../Application/Services/EmployeeService";
import { Employee } from "../Domain/Entities/Employee";
import { Result } from "../Domain/Entities/Result";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');

    const _employeeService = StartupBuilder.resolve(EmployeeService); // Finally.
    const document: string = req.body.document;
    ...
```
