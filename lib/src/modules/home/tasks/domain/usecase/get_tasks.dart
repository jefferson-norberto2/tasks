import '../entities/task.dart';
import '../erros/erros.dart';
import '../repositories/tasks_repository.dart';

abstract class IGetTasks{
  Future<(ITasksErros, List<Task>)> call(String id);
}

class GetTasks implements IGetTasks{
  final ITasksRepository repository;

  GetTasks(this.repository);

  @override
  Future<(ITasksErros, List<Task>)> call(String id) {
    return repository.getTasks(id);
  }
}