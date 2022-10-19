import { KeyVaultSecret } from "@azure/keyvault-secrets";

export interface IKeyVaultClient {
    GetSecret(secretName: string): Promise<string>;
}