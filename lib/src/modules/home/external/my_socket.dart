import 'package:socket_io_client/socket_io_client.dart';

class MySocket {
  late final Socket socket;
  MySocket(){
    socket = io('http://localhost:10100/counter', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
  }

}