import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/perfil_page.dart';

class PerfilModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => PerfilPage(data: r.args.data));
  }
}