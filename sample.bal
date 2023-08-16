import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

function Hello() returns error? {
    log:printDebug("Done");
}

service / on new http:Listener(8090) {

    resource function get .(string name) returns Greeting|error {
        log:printInfo("Request Recieved: For E-mail Sevice");
        int i = 0;
        while (i < 2) {
            i = i + 1;
            if (name === "LK") {
                log:printError("Failed to resolve E-mail", id = i);
            } else if (name === "IND") {
                log:printDebug("Failed to Send E-mail", id = i);
            } else {
                log:printInfo("Succeeded: Sent E-mail", id = i);
            }
        }
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
