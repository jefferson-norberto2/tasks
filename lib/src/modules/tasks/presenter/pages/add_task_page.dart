import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/tasks/presenter/states/add_task_state.dart';
import '../../domain/entities/task.dart';
import '../stores/add_task_store.dart';

class AddTaskPage extends StatefulWidget {
  final String idUser;

  const AddTaskPage({super.key, required this.idUser});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  
  @override
  Widget build(BuildContext context) {
    final taskTextController = TextEditingController(text: "");
    final store = context.watch<AddTaskStore>();
    final state = store.value;

    if (state is LoadingAddTaskState){

    } else if (state is ErrorAddTaskState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Error", message: state.message, isAError: true);
      });
    } else if (state is SucessAddTaskState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Success", message: 'Tarefa adicionada com sucesso');
      });
    }


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Adicionar tarefa'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Adicionar tarefa'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: taskTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task',
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        store.sendTask(Task(id: '', task: taskTextController.text, userId: widget.idUser,));
                      },
                      child: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onExit(AddTaskStore store){
    store.onExitListTasksPage();
    Modular.to.pop();
  }

  void _showMyDialog({required String title, required String message, bool isAError = false, AddTaskStore? store}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(color: isAError ? Colors.red : Colors.black)),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isAError == false){
                  onExit(store!);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}