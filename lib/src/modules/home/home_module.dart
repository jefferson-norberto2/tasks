import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/tasks/tasks_module.dart';
import 'pages/home_page.dart';
import 'perfil/perfil_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
   
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => HomePage(user: args.data), children: [
      ModuleRoute('/task_module/', module: TasksModule()),
      ModuleRoute('/perfil_module/', module: PerfilModule())
    ]),
    // ModuleRoute('/task_module/', module: TasksModule()),
    // ModuleRoute('/perfil_module/', module: PerfilModule())
  ];
}