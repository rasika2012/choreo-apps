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
        Hello();
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
