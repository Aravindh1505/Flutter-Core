import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTClientManager {
  MqttServerClient client = MqttServerClient.withPort('broker.emqx.io', 'flutter_client_ios', 1883);
  //MqttServerClient client = MqttServerClient.withPort('0f8509cb4d2d4577bb6f193b7019f379.s1.eu.hivemq.cloud', 'clientId-U5yjShoDy0', 8884);
  // MqttServerClient client = MqttServerClient.withPort('broker.hivemq.com', 'flutter_client', 1883);

  Future<int> connect() async {
    client.logging(on: true);
    //client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMessage = MqttConnectMessage().startClean().withWillQos(MqttQos.atLeastOnce);

  /*  final connMessage = MqttConnectMessage()
        .authenticateAs('aravindh', '9791779068')
        .keepAliveFor(60)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);*/
    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('MQTTClient::Client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('MQTTClient::Socket exception - $e');
      client.disconnect();
    }

    return 0;
  }

  void disconnect(){
    client.disconnect();
    print('MQTTClient::Dis Connected');
  }

  void subscribe(String topic) {
    print('MQTTClient::subscribe');
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void onConnected() {
    print('MQTTClient::Connected');
  }

  void onDisconnected() {
    print('MQTTClient::Disconnected');
  }

  void onSubscribed(String topic) {
    print('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    print('MQTTClient::Ping response received');
  }

  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
    return client.updates;
  }
}