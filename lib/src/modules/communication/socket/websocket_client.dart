import 'package:socket_io_client/socket_io_client.dart';

import '../constants/constants.dart';

class WebsocketClient{
  late final Socket socket;

  WebsocketClient(){
    socket = io(userUrl, OptionBuilder()
      .setTransports(['websocket'])
      .build());
    
    socket.onConnect((_) {
      print('connect');
      socket.emit('event', 'Receba');
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void dispose(){
    socket.dispose();
  }

  void connect(){
    socket.connect();
  }

  void disconnect(){
    socket.disconnect();
  }

  void clearListeners(){
    socket.clearListeners();
  }
  
}