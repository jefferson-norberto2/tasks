import '../erros/erros.dart';
import '../entities/task.dart';

abstract class ITasksRepository {
  Future<(ITasksErros, List<Task>)> getTasks(String id);
  Future<(ITasksErros, bool)> sendTask(Task task);
}