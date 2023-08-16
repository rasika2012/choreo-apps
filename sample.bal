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
        log:printInfo("Request Recieved:");
        int i = 0;
        while (i < 10) {
            i = i + 1;
            if (name === "LK") {
                log:printError("Error", i = i);
            } else if (name === "IND") {
                log:printDebug("Something went wrong: Greething message sent", i = i);
            } else {
                log:printInfo("Succeeded: Greething message sent", i = i);
            }
        }
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
