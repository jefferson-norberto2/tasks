import 'package:tasks/src/modules/home/external/my_socket.dart';

abstract class IListenCounterDatasource{
  void listenCounter(Function(int) callback);
  void dispose();
}

class ListenCounterDatasource implements IListenCounterDatasource{
  final MySocket mySocket;

  ListenCounterDatasource(this.mySocket);

  @override
  void listenCounter(Function(int) callback){
    mySocket.socket.on('update_response', (data) {
      callback(int.parse(data));
    });
  }

  @override
  void dispose() {
    mySocket.socket.off('update_response');
    mySocket.socket.disconnect();
  }
}