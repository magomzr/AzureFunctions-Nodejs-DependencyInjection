export interface IKeyVaultFunction {
    GetSecretFromKeyVaultByName(secretName: string): Promise<string>;
}