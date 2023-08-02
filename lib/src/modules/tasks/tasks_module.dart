import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:tasks/src/modules/tasks/domain/usecase/get_tasks.dart';
import 'package:tasks/src/modules/tasks/external/datasources/tasks_datasource.dart';
import 'package:tasks/src/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:tasks/src/modules/tasks/infra/repositories/tasks_repository.dart';
import 'package:tasks/src/modules/tasks/presenter/pages/add_task_page.dart';
import 'package:tasks/src/modules/tasks/presenter/stores/add_task_store.dart';
import 'package:tasks/src/modules/tasks/presenter/stores/list_tasks_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'domain/usecase/send_task.dart';
import 'presenter/pages/list_tasks_page.dart';

class TasksModule extends Module {
  
  @override
  final List<Bind> binds = [
    //utils
    Bind.singleton((i) => io.io('http://127.0.0.1:5000/chat', io.OptionBuilder().setTransports(['websocket']).build())),
    //datasources
    Bind.factory<ITasksDatasource>((i) => TasksDatasource(i())),
    //repositories
    Bind.factory<ITasksRepository>((i) => TasksRepository(i())),
    //usecases
    Bind.factory((i) => GetTasks(i())),
    Bind.factory((i) => SendTask(i())),
    //stores
    Bind.singleton((i) => ListTasksStore(i())),
    Bind.singleton((i) => AddTaskStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
        ChildRoute('/', child: (context, args) => ListTasksPage(user: args.data)),
        ChildRoute('/add_task', child: ((context, args) => AddTaskPage(idUser: args.data)))

  ];
}