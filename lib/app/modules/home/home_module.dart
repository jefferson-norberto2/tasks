import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/app/modules/home/external/datasources/fecth_counter_datasource.dart';
import 'package:tasks/app/modules/home/external/datasources/listen_counter_datasource.dart';
import 'package:tasks/app/modules/home/external/my_socket.dart';
import 'package:tasks/app/modules/home/presenter/stores/counter_store.dart';
import 'package:tasks/app/modules/home/submodules/tasks/tasks_module.dart';
import 'presenter/pages/home_page.dart';
import 'submodules/perfil/perfil_module.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    //utils
    i.addSingleton(MySocket.new);

    //datasources
    i.add<IFetchCounterDatasource>(FetchCounterDatasource.new);
    i.add<IListenCounterDatasource>(ListenCounterDatasource.new);

    //stores
    i.addSingleton(CounterStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage(user: r.args.data), children: [
      ModuleRoute('/task_module/', module: TasksModule()),
      ModuleRoute('/perfil_module/', module: PerfilModule())
    ]);
  }
}