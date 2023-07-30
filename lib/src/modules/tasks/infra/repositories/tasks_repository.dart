import 'package:tasks/src/modules/tasks/domain/repositories/tasks_repository.dart';
import '../../domain/entities/task.dart';
import '../../domain/erros/erros.dart';
import '../datasources/tasks_datasource.dart';

class TasksRepository extends ITasksRepository{
  final ITasksDatasource _tasksDatasource;

  TasksRepository(this._tasksDatasource);
  
  @override
  Future<(ITasksErros, List<Task>)> getTasks(String id) async {
    try{
      final sucess = await _tasksDatasource.getTasks(id);
      return (const TasksErros('No exception'), sucess);
    } catch (e) {
      return (const TasksErros("Problem to get tasks in repository implementation"), <Task>[]);
    }
  }

  @override
  Future<(ITasksErros, bool)> sendTask(Task task) async {
    try{
      final sucess = await _tasksDatasource.sendTask(task);
      return (const TasksErros('No exception'), sucess);
    } catch (e) {
      return (const TasksErros("Problem to send task in repository implementation"), false);
    }
  }
}