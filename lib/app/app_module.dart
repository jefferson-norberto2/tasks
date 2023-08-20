import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: LoginModule());
  }
}
