import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/submodules/counter/presenter/page/counter_page.dart';
import '../../../login/domain/entities/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Modular.to.navigate('/home_module/task_module/', arguments: widget.user);

    final leading = SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Tarefas'),
            onTap: () => Modular.to.navigate('/home_module/task_module/', arguments: widget.user),
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () => Modular.to.navigate('/home_module/perfil_module/', arguments: widget.user),
          ),
          CounterPage(userId: widget.user.id!)
        ],
      ),
    );
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-vindo ${widget.user.name}"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => Modular.to.pop(),
            )
          ],
        ),
      body: Row(
        children: [
          leading,
          const Expanded(child: RouterOutlet()),
        ],
      ),
    ));
  }
}