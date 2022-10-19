export interface ISQLConnection {
    executeStoredProcedure(jsonParameters: any, storedProcedureName: string): Promise<any>;
}