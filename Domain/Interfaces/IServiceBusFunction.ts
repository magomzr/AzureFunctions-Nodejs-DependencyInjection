export interface IServiceBusFunction {
    SendMessageToQueue(targetMessage: any, queueName: string): Promise<void>;
}