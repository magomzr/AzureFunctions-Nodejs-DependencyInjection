// import { inject, injectable } from "inversify";
// import { TYPES } from "../../../Application/Controllers/types";
// import { IKeyVaultClient, IKeyVaultFunction } from "../../../Domain/Interfaces";

// @injectable()
// export class KeyVaultFunction implements IKeyVaultFunction {
//     private _keyVaultClient: IKeyVaultClient;

//     constructor(@inject(TYPES.IKeyVaultClient) keyVaultClient: IKeyVaultClient) {
//         this._keyVaultClient = keyVaultClient;
//     };

//     public async GetSecretFromKeyVaultByName(secretName: string): Promise<string> {
//         return await this._keyVaultClient.GetSecret(secretName);
//     };
// };