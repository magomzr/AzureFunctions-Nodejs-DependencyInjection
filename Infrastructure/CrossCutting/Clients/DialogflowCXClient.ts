// TODO

/*
import { SessionsClient } from "@google-cloud/dialogflow-cx";

export class DialogflowCXClient {
    constructor() { }

    private get _sessionsClient(): SessionsClient {
        return new SessionsClient();
    }

    // private get _intentsClient(): IntentsClient {
    //     return new IntentsClient();
    // }

    public async trainIntent() {
        // TODO
    }

    public async detectIntent(message: string) {
        const sessionClient: SessionsClient = this._sessionsClient;
        const sessionPath: string = sessionClient.projectLocationAgentSessionPath(
            process.env.PROJECT_ID,
            process.env.LOCATION,
            process.env.AGENT_ID,
            process.env.SESSION_ID
        );
        const [response] = await sessionClient.detectIntent({
            session: sessionPath,
            queryInput: {
                text: {
                    text: message
                },
                languageCode: process.env.LANGUAGE
            }
        });
        return response;
    };
}

*/