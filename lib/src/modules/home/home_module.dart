import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/modules/counter/external/datasources/fecth_counter_datasource.dart';
import 'package:tasks/src/modules/home/modules/counter/external/datasources/listen_counter_datasource.dart';
import 'package:tasks/src/modules/home/modules/counter/presenter/store/counter_store.dart';
import 'package:tasks/src/modules/home/modules/tasks/tasks_module.dart';
import 'presenter/pages/home_page.dart';
import 'modules/perfil/perfil_module.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'presenter/stores/home_store.dart';

class HomeModule extends Module {
  final socket = io.io('http://localhost:5000/counter',
    io.OptionBuilder().setTransports(['websocket']).build());
  // @override
  // final List<Bind> binds = [
  //   //utils
  //   Bind.singleton((i) => io.io('http://localhost:5000/counter',
  //     io.OptionBuilder().setTransports(['websocket']).build())),
    
  //   //datasources
  //   Bind.factory<IFetchCounterDatasource>((i) => FetchCounterDatasource(i())),
  //   Bind.factory<IListenCounterDatasource>((i) => ListenCounterDatasource(i())),

  //   //stores
  //   Bind.singleton((i) => CounterStore(i(), i())),
  //   Bind.singleton((i) => HomeStore())
  // ];

  @override
  void binds(i) {
    //utils
    i.addSingleton(socket);

    //datasources
    i.add<io.Socket>(FetchCounterDatasource.new);
    i.add<io.Socket>(ListenCounterDatasource.new);

    //stores
    i.addSingleton(CounterStore.new);
    i.addSingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage(user: r.args.data), children: [
      ModuleRoute('/task_module/', module: TasksModule()),
      ModuleRoute('/perfil_module/', module: PerfilModule())
    ]);
  }
}