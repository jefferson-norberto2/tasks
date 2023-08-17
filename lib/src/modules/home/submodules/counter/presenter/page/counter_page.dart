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
  bool init = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CounterStore>().fetchCounter(21);
      if(init){
        setState(() {
          init = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CounterStore>();
    final state = store.value;
    int counter = state is SucessCounterState ? state.value : 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Counter $counter'),
      ],
    );
  }
}