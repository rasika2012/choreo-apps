import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

function Hello() returns error? {
    log:printDebug("Hello");
}

service / on new http:Listener(8090) {

    resource function get .(string name) returns Greeting|error {
        log:printInfo("tttt");
        int i = 0;
        while (i < 10) {
            i = i + 1;
            log:printInfo("tttt", i = i);
        }
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
