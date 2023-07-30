import 'package:flutter/material.dart';
import 'package:tasks/src/modules/tasks/domain/usecase/get_tasks.dart';
import 'package:tasks/src/modules/tasks/presenter/states/list_tasks_state.dart';

class ListTasksStore extends ValueNotifier<IListTasksState> {
  final IGetTasks _getTasks;
  
  ListTasksStore(this._getTasks) : super(EmptyListTasksState());

  void emit(IListTasksState state) => value = state;

  Future<void> listTasks(String id) async {
    emit(LoadingListTasksState());
    final result = await _getTasks.call(id);

    if(result.$1.message != "No exception") {
      emit(ErrorListTasksState(result.$1.message));
    } else {
      emit(SucessListTasksState(result.$2));
    }
  }
  
  void onExitListTasksPage() {
    emit(EmptyListTasksState());
  }
}