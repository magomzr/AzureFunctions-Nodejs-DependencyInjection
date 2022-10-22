import { injectable } from 'inversify';
import { ConnectionPool, Request, IProcedureResult, IRecordSet, VarChar, MAX } from 'mssql'

@injectable()
export class SQLConnection {
    constructor() { }

    /**
     * Creating a connection pool using a SQL connection string.
     */
    private get _connectionPool(): ConnectionPool {
        return new ConnectionPool(process.env.SQL_CONNECTIONSTRING);
    };

    /**
     * Execute a stored procedure.
     * @param jsonParameters Sending parameters to stored procedure as an object.
     * @param storedProcedureName Stored procedure name defined in database.
     * @returns Stored procedure result.
     */
    public async executeStoredProcedure(jsonParameters: any, storedProcedureName: string): Promise<any> {
        let result: { [x: string]: IRecordSet<any>; } | IRecordSet<any>[];
        await this._connectionPool.connect()
            .then(async (conn) => {
                const request: Request = new Request(conn);
                request.input('json', VarChar(MAX), JSON.stringify(jsonParameters));
                const response: IProcedureResult<any> = await request.execute(storedProcedureName);
                result = response.recordsets[0];
            });
        return result;
    };
};