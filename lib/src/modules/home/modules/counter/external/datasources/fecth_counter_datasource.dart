import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class IFetchCounterDatasource{
  void fetchCounter(int userId);
}

class FetchCounterDatasource implements IFetchCounterDatasource{
  final io.Socket socket;

  FetchCounterDatasource(this.socket);

  @override
  void fetchCounter(int userId){
    socket.emit('update_request', userId);
  }
}