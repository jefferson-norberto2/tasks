import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/presenter/states/counter_state.dart';
import '../stores/counter_store.dart';

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
  void dispose() {
    final store = context.read<CounterStore>();
    store.listenCounterDatasource.dispose();
    debugPrint('dispose counter');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    final store = context.watch<CounterStore>();
    final state = store.value;
    final counter = state is SucessCounterState ? state.value : 0;

    return Text('Counter: $counter');
  }
}