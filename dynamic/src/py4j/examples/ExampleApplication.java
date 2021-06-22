package py4j.examples;

import py4j.GatewayServer;

public class ExampleApplication {
    public static void main(String[] args) {
        GatewayServer.turnLoggingOff();
        GatewayServer server = new GatewayServer(new ExampleEntryPoint());
        server.start();
    }
}
