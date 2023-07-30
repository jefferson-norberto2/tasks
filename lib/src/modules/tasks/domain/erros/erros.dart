abstract class ITasksErros{
  final String message;
  final StackTrace? stackTrace;
  
  const ITasksErros(this.message, [this.stackTrace]);
}

class TasksErros extends ITasksErros{
  const TasksErros(super.message, [super.stackTrace]);
}

class TasksDatasourceErros extends ITasksErros{
  const TasksDatasourceErros(super.message, [super.stackTrace]);
}