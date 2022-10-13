// Our Startup.ts file
import 'reflect-metadata';
import { Container } from 'inversify';
import { IEmployeeRepository } from '../../Domain/Interfaces/IEmployeeRepository';
import { ISQLRepository } from '../../Domain/Interfaces/ISQLRepository';
import { SQLRepository } from '../../Infrastructure/DataAccess/Databases/SQLRepository';
import { EmployeeRepository } from '../../Infrastructure/DataAccess/Repositories/EmployeeRepository';
import { EmployeeService } from '../Services/EmployeeService';
import { TYPES } from './types';

const StartupBuilder = new Container();

StartupBuilder.bind<ISQLRepository>(TYPES.ISQLRepository).to(SQLRepository).inTransientScope();
StartupBuilder.bind<IEmployeeRepository>(TYPES.IEmployeeRepository).to(EmployeeRepository).inSingletonScope();
StartupBuilder.bind(EmployeeService).toSelf().inSingletonScope();


export { StartupBuilder };