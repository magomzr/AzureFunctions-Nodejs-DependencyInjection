// import { DefaultAzureCredential } from "@azure/identity";
// import { SecretClient } from "@azure/keyvault-secrets";
// import { injectable } from "inversify";

// @injectable()
// export class KeyVaultClient {
//     constructor() { }

//     private get _secretClient() {
//         return new SecretClient(process.env.URL_KEY_VAULT, new DefaultAzureCredential());
//     }

//     public async GetSecret(secretName: string): Promise<string> {
//         return (await this._secretClient.getSecret(secretName)).value;
//     };
// };
