import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/tasks/presenter/states/list_tasks_state.dart';
import 'package:tasks/src/modules/tasks/presenter/stores/list_tasks_store.dart';

import '../../../login/domain/entities/user.dart';

class ListTasksPage extends StatefulWidget {
  final User user;
  const ListTasksPage({super.key, required this.user});

  @override
  State<ListTasksPage> createState() => _ListTasksPageState();
}

class _ListTasksPageState extends State<ListTasksPage> {

  @override
  void initState() {
    super.initState();
    context.read<ListTasksStore>().listTasks(widget.user.id!);
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ListTasksStore>();
    final state = store.value;
    final listTasks = (state is SucessListTasksState) ? state.tasks : [];

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Tasks - ${widget.user.name}'),
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/task_module/add_task', arguments: widget.user.id!).then((value) => context.read<ListTasksStore>().listTasks(widget.user.id!));
            },
            icon: const Icon(Icons.add_chart_sharp),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Lista de tarefas'),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: listTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${listTasks[index].task}'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}