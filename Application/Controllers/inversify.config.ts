// Our Startup.ts file
import 'reflect-metadata';
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
StartupBuilder.bind(EmployeeService).toSelf().inSingletonScope();


export { StartupBuilder };