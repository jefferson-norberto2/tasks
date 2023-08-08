import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/perfil_page.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PerfilPage(data: args.data)),
  ];
}