import { ConnectionPool, Request, IProcedureResult, IRecordSet, VarChar, MAX } from 'mssql'

export class SQLRepository {
    constructor() { }
    /**
     * Execute a stored procedure.
     * @param jsonParameters Sending parameters to stored procedure as an object.
     * @param storedProcedureName Stored procedure name defined in database.
     * @returns Stored procedure result.
     */
    async executeStoredProcedure(jsonParameters: any, storedProcedureName: string): Promise<any> {
        var result: { [x: string]: IRecordSet<any>; } | IRecordSet<any>[];
        const conn: ConnectionPool = new ConnectionPool({
            "user": process.env.USER,
            "password": process.env.PASSWORD,
            "server": process.env.SERVER,
            "database": process.env.DATABASE,
            "options": {
                "encrypt": true
            }
        });
        await conn.connect()
            .then(async (conn) => {
                const request: Request = new Request(conn);
                request.input('json', VarChar(MAX), jsonParameters);
                const response: IProcedureResult<any> = await request.execute(storedProcedureName);
                result = response.recordsets;
            });
        return result;
    }
}