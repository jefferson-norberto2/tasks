import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../state/counter_state.dart';
import '../store/counter_store.dart';

class CounterPage extends StatefulWidget {

  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CounterStore>();
    final state = store.value;
    int counter = 0;

    if (state is ErrorCounterState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        
      });
    } else if (state is SucessCounterState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        counter = state.value;
      });
    }

    store.connectAndListen(15);
    return Text('Counter $counter');
  }
}