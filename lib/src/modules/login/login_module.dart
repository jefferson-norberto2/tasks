import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/home_module.dart';
import 'domain/usecases/get_user.dart';
import 'package:http/http.dart' as http;
import 'domain/usecases/send_user.dart';
import 'external/datasources/get_user_datasource.dart';
import 'infra/datasources/get_user_datasource.dart';
import 'presenter/pages/login_page.dart';
import 'presenter/pages/register_user_page.dart';
import 'presenter/stores/register_user_store.dart';
import 'domain/repositories/user_repository.dart';
import 'external/datasources/send_user_datasource.dart';
import 'infra/datasources/send_user_datasource.dart';
import 'infra/repositories/user_repository.dart';
import 'presenter/stores/login_store.dart';

class LoginModule extends Module{

  @override
  void binds(i) {
    //Utils
    i.add(http.Client.new);

    //Datasources
    i.add<IGetUserDatasource>(GetUserDatasource.new);
    i.add<ISendUserDatasource>(SendUserDatasource.new);

    //Repositories
    i.add<IUserRepository>(UserRepository.new);

    //UseCases
    i.add<IGetUser>(GetUser.new);
    i.add<ISendUser>(SendUser.new);

    //Stores
    i.addSingleton(LoginStore.new);
    i.addSingleton(RegisterUserStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/register_user/', child: (context) => const RegisterUserPage());
    r.module('/home_module/', module: HomeModule());  
    }
}