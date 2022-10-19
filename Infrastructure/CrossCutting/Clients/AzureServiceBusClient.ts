import { ServiceBusClient, ServiceBusSender } from '@azure/service-bus'
import { injectable } from 'inversify';

@injectable()
export class AzureServiceBusClient {
    constructor() { }

    private get _servicebusClient(): ServiceBusClient {
        return new ServiceBusClient(process.env.SB_CONNECTIONSTRING);
    }

    /**
     * Send message to Azure Service Bus queue.
     * @param message Messages to send.
     * @param sbQueueName Queue name as string.
     */
    public async sendMesageToQueue(message: any, sbQueueName: string): Promise<void> {
        const sender: ServiceBusSender = this._servicebusClient.createSender(sbQueueName);
        await sender.sendMessages([{ body: message }]);
    }
};
