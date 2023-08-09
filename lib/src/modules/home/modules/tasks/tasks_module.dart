import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'domain/repositories/tasks_repository.dart';
import 'domain/usecase/get_tasks.dart';
import 'domain/usecase/send_task.dart';

import 'infra/datasources/get_tasks_datasource.dart';
import 'infra/datasources/send_tasks_datasource.dart';
import 'infra/repositories/tasks_repository.dart';

import 'external/datasources/get_tasks_datasource.dart';
import 'external/datasources/send_tasks_datasource.dart';

import 'presenter/pages/list_tasks_page.dart';
import 'presenter/pages/add_task_page.dart';
import 'presenter/stores/add_task_store.dart';
import 'presenter/stores/list_tasks_store.dart';

class TasksModule extends Module {
  
  @override
  final List<Bind> binds = [
    //utils
    Bind.factory((i) => http.Client()),
    
    //datasources
    Bind.factory<IGetTasksDatasource>((i) => GetTasksDatasource(i())),
    Bind.factory<ISendTasksDatasource>((i) => SendTasksDatasource(i())),
    
    //repositories
    Bind.factory<ITasksRepository>((i) => TasksRepository(i(), i())),
    
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
        ChildRoute('/add_task/', child: ((context, args) => AddTaskPage(idUser: args.data)))

  ];
}