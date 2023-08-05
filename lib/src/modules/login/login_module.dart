import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/login/domain/usecases/get_user.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/src/modules/login/domain/usecases/send_user.dart';
import 'package:tasks/src/modules/login/external/datasources/user_datasources.dart';
import 'package:tasks/src/modules/login/infra/datasources/user_datasource.dart';
import 'package:tasks/src/modules/login/presenter/pages/login_page.dart';
import 'package:tasks/src/modules/login/presenter/pages/register_user_page.dart';
import 'package:tasks/src/modules/login/presenter/stores/register_user_store.dart';
import '../home/tasks/tasks_module.dart';
import 'domain/repositories/user_repository.dart';
import 'infra/repositories/user_repository.dart';
import 'presenter/stores/login_store.dart';

class LoginModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    //utils
    Bind.factory((i) => http.Client()),
    //datasources
    Bind.factory<IUserDatasource>((i) => UserDatasource(i())),
    //repositories
    Bind.factory<IUserRepository>((i) => UserRepository(i())),
    //usecases
    Bind.factory((i) => GetUser(i())),
    Bind.factory((i) => SendUser(i())),
    //stores
    Bind.singleton((i) => LoginStore(i())),
    Bind.singleton((i) => RegisterUserStore(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginPage()),
    ChildRoute('/register_user/', child: (context, args) => const RegisterUserPage()),
    ModuleRoute('/task_module/', module: TasksModule()),
  ];
}