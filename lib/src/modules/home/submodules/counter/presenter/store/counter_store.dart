import 'package:flutter/material.dart';
import 'package:tasks/src/modules/home/submodules/counter/external/datasources/fecth_counter_datasource.dart';
import 'package:tasks/src/modules/home/submodules/counter/external/datasources/listen_counter_datasource.dart';
import 'package:tasks/src/modules/home/submodules/counter/presenter/state/counter_state.dart';

class CounterStore extends ValueNotifier<ICounterState> {
  final IFetchCounterDatasource fetchCounterDatasource;
  final IListenCounterDatasource listenCounterDatasource;

  CounterStore(this.fetchCounterDatasource, this.listenCounterDatasource) : super(EmptyCounterState()){
    listenCounter();
  }

  void emit(ICounterState state) => value = state;

  void fetchCounter(int userId) {
    emit(LoadingCounterState());
    fetchCounterDatasource.fetchCounter(userId);
  }

  void listenCounter(){
    listenCounterDatasource.listenCounter(totalTasks);
  }

  void totalTasks(int totalTasks){
    emit(SucessCounterState(totalTasks));
  }
}