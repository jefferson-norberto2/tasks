import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:tasks/src/modules/tasks/domain/entities/task.dart';


class MySocket {
  late io.Socket socket;

  void connect(url) {
    socket = io.io(url, io.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .build());
  }

  void disconnect() {
    socket.disconnect();
  }

  void sendMessage(String nameEvent, String message) {
    socket.emit(nameEvent, message);
  }

  Future<List<Task>> listenMessage(String nameEvent, Function(String) function) {
    socket.on(nameEvent, (receivedData) => function(receivedData));
    return Future.value([]);
  }
}