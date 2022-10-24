import { inject, injectable } from "inversify";
import { TYPES } from "../../../Application/Controllers/types";
import { IAzureServiceBusClient, IServiceBusFunction } from "../../../Domain/Interfaces";

/**
 * Class that uses Azure Service Bus connection client in order to do CRUD operations.
 */
@injectable()
export class ServiceBusFunction implements IServiceBusFunction {
    private _sbClient: IAzureServiceBusClient;

    constructor(@inject(TYPES.IAzureServiceBusClient) sbClient: IAzureServiceBusClient) {
        this._sbClient = sbClient;
    };

    /**
     * Method to send messages to an specific queue.
     * @param targetMessage Message you want to send.
     * @param queueName The queue name related to Azure Service Bus connection string.
     * @returns `void`.
     */
    public async SendMessageToQueue(targetMessage: any, queueName: string): Promise<void> {
        return await this._sbClient.sendMesageToQueue(targetMessage, queueName);
    };
}