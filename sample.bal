import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

function hello() returns error? {
    log:printDebug("Hello");
}

public function main() returns error? {
    var e = hello();
    log:printError("Err", e = check e);
}
