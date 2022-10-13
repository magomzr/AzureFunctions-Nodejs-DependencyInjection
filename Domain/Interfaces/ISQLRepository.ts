export interface ISQLRepository {
    executeStoredProcedure(jsonParameters: any, storedProcedureName: string): Promise<any>;
}