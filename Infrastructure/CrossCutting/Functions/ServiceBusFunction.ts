import { inject, injectable } from "inversify";
import { TYPES } from "../../../Application/Controllers/types";
import { IAzureServiceBusClient, IServiceBusFunction } from "../../../Domain/Interfaces";

@injectable()
export class ServiceBusFunction implements IServiceBusFunction {
    private _sbClient: IAzureServiceBusClient;

    constructor(@inject(TYPES.IAzureServiceBusClient) sbClient: IAzureServiceBusClient) {
        this._sbClient = sbClient;
    };

    public async SendMessageToQueue(targetMessage: any, queueName: string): Promise<void> {
        return await this._sbClient.sendMesageToQueue(targetMessage, queueName);
    };
}