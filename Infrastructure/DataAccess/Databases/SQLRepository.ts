import { injectable } from 'inversify';
import { ConnectionPool, Request, IProcedureResult, IRecordSet, VarChar, MAX } from 'mssql'
import { ISQLRepository } from '../../../Domain/Interfaces/ISQLRepository';

@injectable()
export class SQLRepository implements ISQLRepository {
    constructor() { }
    /**
     * Execute a stored procedure.
     * @param jsonParameters Sending parameters to stored procedure as an object.
     * @param storedProcedureName Stored procedure name defined in database.
     * @returns Stored procedure result.
     */
    async executeStoredProcedure(jsonParameters: any, storedProcedureName: string): Promise<any> {
        let result: { [x: string]: IRecordSet<any>; } | IRecordSet<any>[];
        const conn: ConnectionPool = new ConnectionPool({
            user: process.env.USER,
            password: process.env.PASSWORD,
            server: process.env.SERVER,
            database: process.env.DATABASE,
            options: {
                encrypt: true
            }
        });
        await conn.connect()
            .then(async (conn) => {
                const request: Request = new Request(conn);
                request.input('json', VarChar(MAX), JSON.stringify(jsonParameters));
                const response: IProcedureResult<any> = await request.execute(storedProcedureName);
                result = response.recordsets[0];
            });
        return result;
    }
    
    /**
     * This is a test function to returns boolean results.
     * @returns boolean.
     */
    saveMethod(): boolean {
        return true;
    }
}