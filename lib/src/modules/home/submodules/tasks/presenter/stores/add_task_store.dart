import 'package:flutter/material.dart';
import '../../domain/usecase/send_task.dart';
import '../states/add_task_state.dart';
import '../../domain/entities/task.dart';

class AddTaskStore extends ValueNotifier<IAddTaskState> {
  final ISendTask _getTasks;
  
  AddTaskStore(this._getTasks) : super(EmptyAddTaskState());

  void emit(IAddTaskState state) => value = state;

  Future<void> sendTask(Task task) async {
    emit(LoadingAddTaskState());
    final result = await _getTasks.call(task);

    if(result.$1.message != "No exception") {
      emit(ErrorAddTaskState(result.$1.message));
    } else {
      emit(SucessAddTaskState(result.$2));
    }
  }
  
  void onExitListTasksPage() {
    emit(EmptyAddTaskState());
  }
}