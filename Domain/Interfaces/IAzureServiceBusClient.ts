export interface IAzureServiceBusClient {
    sendMesageToQueue(message: any, sbQueueName: string): Promise<void>;
}