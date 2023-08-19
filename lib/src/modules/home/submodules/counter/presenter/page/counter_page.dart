import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/submodules/counter/presenter/state/counter_state.dart';
import '../store/counter_store.dart';

class CounterPage extends StatefulWidget {
  final String userId;  
  const CounterPage({super.key, required this.userId});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CounterStore>().fetchCounter(int.parse(widget.userId));
    });
  }

  @override
  Widget build(BuildContext context) {    
    final store = context.watch<CounterStore>();
    final state = store.value;
    final counter = state is SucessCounterState ? state.value : 0;

    return Text('Counter: $counter');
  }
}