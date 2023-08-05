import '../../domain/entities/task.dart';

abstract class ITasksDatasource{
  Future<List<Task>> getTasks(String id);
  Future<bool> sendTask(Task task);
}