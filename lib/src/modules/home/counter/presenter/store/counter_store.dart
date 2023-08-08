import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:tasks/src/modules/home/counter/presenter/state/counter_state.dart';

class CounterStore extends ValueNotifier<ICounterState> {
  final io.Socket socket;

  CounterStore(this.socket) : super(EmptyCounterState());

  void emit(ICounterState state) => value = state;

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream
void connectAndListen(int idUser){
    socket.onConnect((_) {
     print('connect');
     
    });
    socket.emit('update', idUser);
    //When an event recieved from server, data is added to the stream
    socket.on('update', (data) {
      print(data);
      emit(data);
    });
    socket.onDisconnect((_) => print('disconnect'));

  }
}