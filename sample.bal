import ballerina/log;
import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting|error {
        http:Client httpEp = check new (url = "http://reqres.in/api/users?page=2");
        record {} getResponse = check httpEp->get(path = "");
        http:Client httpEp2 = check new (url = "http://google.com/api/users?page=2");
        record {} getResponse2 = check httpEp2->get(path = "");
        log:printDebug(getResponse.toBalString());
        log:printDebug(getResponse2.toBalString());
        log:printInfo("tttt");
        Greeting greetingMessage = {"from": "Choreo", "to": name, "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
