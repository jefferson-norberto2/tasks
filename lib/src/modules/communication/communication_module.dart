import 'package:flutter_modular/flutter_modular.dart';
import '../login/login_module.dart';
import 'socket/websocket_client.dart';

class CommunicationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => WebsocketClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}