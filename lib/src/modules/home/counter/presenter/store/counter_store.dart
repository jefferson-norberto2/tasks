import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:tasks/src/modules/home/counter/presenter/state/counter_state.dart';

class CounterStore extends ValueNotifier<ICounterState> {
  final io.Socket socket;

  CounterStore(this.socket) : super(EmptyCounterState()){
    connectAndListen();
  }

  void emit(ICounterState state) => value = state;

  void connectAndListen(){
    socket.onConnect((data){
      print('connect');
    });
    socket.on('update_response', (data) {
      print(data);
      emit(SucessCounterState(int.parse(data)));
    });
    socket.onDisconnect((_) => print('disconnect'));

  }
}