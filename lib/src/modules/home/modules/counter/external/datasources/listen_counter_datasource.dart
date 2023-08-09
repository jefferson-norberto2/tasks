import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class IListenCounterDatasource{
  void listenCounter(Function(int) callback);
}

class ListenCounterDatasource implements IListenCounterDatasource{
  final io.Socket socket;

  ListenCounterDatasource(this.socket);

  @override
  void listenCounter(Function(int) callback){
    socket.on('update_response', (data) {
      callback(int.parse(data));
    });
  }
}