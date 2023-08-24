import 'package:tasks/app/modules/home/external/my_socket.dart';

abstract class IFetchCounterDatasource{
  void fetchCounter(int userId);
}

class FetchCounterDatasource implements IFetchCounterDatasource{
  final MySocket mySocket;

  FetchCounterDatasource(this.mySocket);

  @override
  void fetchCounter(int userId){
    mySocket.socket.emit('update_request', userId);
  }
}