import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:tasks/src/modules/home/counter/presenter/state/counter_state.dart';

class CounterStore extends ValueNotifier<ICounterState> {
  final io.Socket socket;

  CounterStore(this.socket) : super(EmptyCounterState()){
    listenCounter();
  }

  void emit(ICounterState state) => value = state;

  void fetchCounter(int value) {
    socket.emit('update_request', value);
  }

  void listenCounter(){
    socket.on('update_response', (data) {
      print('recebi o contador $data');
      emit(SucessCounterState(int.parse(data)));
    });
  }
}