import 'package:flutter/material.dart';
import 'package:tasks/src/modules/home/external/datasources/fecth_counter_datasource.dart';
import 'package:tasks/src/modules/home/external/datasources/listen_counter_datasource.dart';
import 'package:tasks/src/modules/home/presenter/states/counter_state.dart';

class CounterStore extends ValueNotifier<ICounterState> {
  final IFetchCounterDatasource fetchCounterDatasource;
  final IListenCounterDatasource listenCounterDatasource;

  CounterStore(this.fetchCounterDatasource, this.listenCounterDatasource) : super(EmptyCounterState()){
    listenCounter();
  }

  void emit(ICounterState state) => value = state;

  void fetchCounter(int userId) {
    fetchCounterDatasource.fetchCounter(userId);
  }

  void listenCounter(){
    listenCounterDatasource.listenCounter(totalTasks);
  }

  void totalTasks(int totalTasks){
    emit(SucessCounterState(totalTasks));
  }
}