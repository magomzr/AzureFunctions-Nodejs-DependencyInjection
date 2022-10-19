import { inject, injectable } from "inversify";
import { TYPES } from "../../../Application/Controllers/types";
import { IAzureServiceBusClient } from "../../../Domain/Interfaces/IAzureServiceBusClient";

@injectable()
export class ServiceBusFunction {
    private _sbClient: IAzureServiceBusClient;

    constructor(@inject(TYPES.IAzureServiceBusClient) sbClient: IAzureServiceBusClient) {
        this._sbClient = sbClient;
    }

    public async SendMessageToQueue(targetMessage: any /* ActionLog | Error*/, queueName: string) {
        return await this._sbClient.sendMesageToQueue(targetMessage, queueName);
    }
}