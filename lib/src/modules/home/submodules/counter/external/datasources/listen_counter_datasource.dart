import 'package:tasks/src/modules/home/submodules/counter/my_socket.dart';

abstract class IListenCounterDatasource{
  void listenCounter(Function(int) callback);
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
}