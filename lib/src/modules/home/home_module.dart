import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/counter/presenter/store/counter_store.dart';
import 'package:tasks/src/modules/home/tasks/tasks_module.dart';
import 'pages/home_page.dart';
import 'perfil/perfil_module.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    
    Bind.singleton((i) => io.io('http://localhost:5000/counter',
      io.OptionBuilder().setTransports(['websocket']).build())),
    Bind.singleton((i) => CounterStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => HomePage(user: args.data), children: [
      ModuleRoute('/task_module/', module: TasksModule()),
      ModuleRoute('/perfil_module/', module: PerfilModule())
    ]),
  ];
}