import 'reflect-metadata';
import { Container } from 'inversify';
import { IEmployeeRepository, ISQLConnection, IAzureServiceBusClient, IServiceBusFunction } from '../../Domain/Interfaces';
import { SQLConnection } from '../../Infrastructure/DataAccess/Databases/SQLConnection';
import { EmployeeRepository } from '../../Infrastructure/DataAccess/Repositories/EmployeeRepository';
import { EmployeeService } from '../Services/EmployeeService';
import { TYPES } from './types';
import { AzureServiceBusClient } from '../../Infrastructure/CrossCutting/Clients/AzureServiceBusClient';
import { ServiceBusFunction } from '../../Infrastructure/CrossCutting/Functions/ServiceBusFunction';

const StartupBuilder = new Container();

StartupBuilder.bind<ISQLConnection>(TYPES.ISQLConnection).to(SQLConnection).inTransientScope();
StartupBuilder.bind<IEmployeeRepository>(TYPES.IEmployeeRepository).to(EmployeeRepository).inSingletonScope();
StartupBuilder.bind<IAzureServiceBusClient>(TYPES.IAzureServiceBusClient).to(AzureServiceBusClient).inSingletonScope();
StartupBuilder.bind<IServiceBusFunction>(TYPES.IServiceBusFunction).to(ServiceBusFunction).inSingletonScope();
StartupBuilder.bind(EmployeeService).toSelf().inSingletonScope();

export { StartupBuilder };