import ballerina/log;
import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {

    isolated function sayHello() {
        log:printInfo("hello");
    }

    resource function get .(string name) returns Greeting|error {
        log:printInfo("tttt");
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
    resource function get ./hello/(string name) returns Greeting|error {
        log:printInfo("tttt");
        sayHello();
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
