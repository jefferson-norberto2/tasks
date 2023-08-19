import '../../domain/entities/task.dart';

abstract class IListTasksState {}

class SucessListTasksState implements IListTasksState {
  final List<Task> tasks;

  SucessListTasksState(this.tasks);
}

class EmptyListTasksState extends IListTasksState {}

class ErrorListTasksState extends IListTasksState {
  final String message;

  ErrorListTasksState(this.message);
}

class LoadingListTasksState extends IListTasksState {}