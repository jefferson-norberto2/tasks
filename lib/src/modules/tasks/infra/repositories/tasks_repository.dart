import 'dart:convert';

import '../../domain/repositories/tasks_repository.dart';
import '../adapters/task_adapter.dart';
import '../datasources/get_tasks_datasource.dart';
import '../../domain/entities/task.dart';
import '../../domain/erros/erros.dart';
import '../adapters/user_adapter.dart';
import '../datasources/send_tasks_datasource.dart';

class TasksRepository extends ITasksRepository{
  final IGetTasksDatasource _getTasksDatasource;
  final ISendTasksDatasource _sendTaskDatasource;

  TasksRepository(this._getTasksDatasource, this._sendTaskDatasource);
  
  @override
  Future<(ITasksErros, List<Task>)> getTasks(String id) async {
    try{
      final request = await _getTasksDatasource.getTasks(id);
      final user = UserAdapter.fromProto(request);
      return (const TasksErros('No exception'), user.tasks);
    } catch (e) {
      return (const TasksErros("Problem to get tasks in repository implementation"), <Task>[]);
    }
  }

  @override
  Future<(ITasksErros, bool)> sendTask(Task task) async {
    try{
      final body = TaskAdapter.toProtoBuffer(task);
      final request = await _sendTaskDatasource.sendTask(body);
      final decoded = jsonDecode(request);
      return (const TasksErros('No exception'), decoded['user'] as bool);
    } catch (e) {
      return (const TasksErros("Problem to send task in repository implementation"), false);
    }
  }
}