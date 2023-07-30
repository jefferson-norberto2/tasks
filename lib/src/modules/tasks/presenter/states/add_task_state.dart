
abstract class IAddTaskState {}

class SucessAddTaskState implements IAddTaskState {
  final bool success;

  SucessAddTaskState(this.success);
}

class EmptyAddTaskState extends IAddTaskState {}

class ErrorAddTaskState extends IAddTaskState {
  final String message;

  ErrorAddTaskState(this.message);
}

class LoadingAddTaskState extends IAddTaskState {}