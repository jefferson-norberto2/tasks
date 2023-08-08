import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tasks/src/modules/home/communication/constants/constants.dart';
import 'package:tasks/src/modules/home/communication/sockets/websocke_io.dart';

class CommunicationModule extends Module {
  
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => io(urlSocket, optionBuilder)),
    Bind.singleton((i) => WebsocketIo(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/', module: HomeModule()),
  ];
}