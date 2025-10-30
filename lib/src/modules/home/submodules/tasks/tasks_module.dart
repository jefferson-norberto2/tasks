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
  void binds(i) {
    //utils
    i.add(http.Client.new);

    //datasources
    i.add<IGetTasksDatasource>(GetTasksDatasource.new);
    i.add<ISendTasksDatasource>(SendTasksDatasource.new);

    //repositories
    i.add<ITasksRepository>(TasksRepository.new);

    //usecases
    i.add<IGetTasks>(GetTasks.new);
    i.add<ISendTask>(SendTask.new);

    //stores
    i.addSingleton(ListTasksStore.new);
    i.addSingleton(AddTaskStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => ListTasksPage(user: r.args.data));
    r.child('/add_task/', child: (context) => AddTaskPage(idUser: r.args.data));
  }
  
}