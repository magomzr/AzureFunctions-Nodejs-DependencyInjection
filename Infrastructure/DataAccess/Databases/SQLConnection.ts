import { injectable } from 'inversify';
import { ConnectionPool, Request, IProcedureResult, IRecordSet, VarChar, MAX } from 'mssql'

@injectable()
export class SQLConnection {
    constructor() { }

    /**
     * Creating a connection pool.
     */
    private get _connectionPool(): ConnectionPool {
        return new ConnectionPool({
            user: process.env.USER,
            password: process.env.PASSWORD,
            server: process.env.SERVER,
            database: process.env.DATABASE,
            port: parseInt(process.env.PORT),
            options: {
                encrypt: true,
                trustServerCertificate: true
            }
        });
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