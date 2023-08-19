import '../entities/task.dart';
import '../erros/erros.dart';
import '../repositories/tasks_repository.dart';

abstract class ISendTask{
  Future<(ITasksErros, bool)> call(Task task);
}

class SendTask implements ISendTask{
  final ITasksRepository _repository;

  SendTask(this._repository);
  @override
  Future<(ITasksErros, bool)> call(Task task) {
    if (task.task.isEmpty){
      return Future.value((const TasksErros("Need add some text"), false));
    } else {
      return _repository.sendTask(task);
    }
  }
}