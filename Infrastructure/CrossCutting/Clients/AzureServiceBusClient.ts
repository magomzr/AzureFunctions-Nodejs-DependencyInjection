import { IAzureServiceBusClient } from "../../../Domain/Interfaces/IAzureServiceBusClient";
import { ServiceBusClient, ServiceBusMessage, ServiceBusSender } from '@azure/service-bus'

export class AzureServiceBusClient implements IAzureServiceBusClient {
    constructor() { }
    /**
     * Send message to Azure Service Bus queue.
     * @param message Messages to send.
     * @param sbQueueName Queue name as string.
     */
    async sendMesageToQueue(message: any, sbQueueName: string): Promise<void> {
        const sbClient: ServiceBusClient = new ServiceBusClient(process.env.SB_CONNECTIONSTRING);
        const sender: ServiceBusSender = sbClient.createSender(sbQueueName);
        await sender.sendMessages([{ body: message }]);
    }
}