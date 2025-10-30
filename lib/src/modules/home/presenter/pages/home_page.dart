import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/home/presenter/pages/counter_page.dart';
import '../../../login/domain/entities/user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Modular.to.pushNamed(
      './task_module/',
      arguments: widget.user,
    );
  }

  @override
  Widget build(BuildContext context) {
    final leading = Container(
      color: Colors.purple.shade100,
      width: MediaQuery.of(context).size.width * 0.2,
      child: NavigationListener(builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: const Text('Tarefas'),
              onTap: () => Modular.to.pushReplacementNamed(
                '../task_module/',
                arguments: widget.user,
              ),
              selected: Modular.to.path.endsWith('/task_module/'),
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () => Modular.to.pushReplacementNamed(
                '../perfil_module/',
                arguments: widget.user,
              ),
              selected: Modular.to.path.endsWith('/perfil_module/'),
            ),
            CounterPage(
              userId: widget.user.id!,
            )
          ],
        );
      }),
    );

    return WillPopScope(
      onWillPop: () async {
        Modular.to.pushReplacementNamed(
          '/',
          arguments: widget.user,
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bem-vindo ${widget.user.name}"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => Modular.to.canPop() ? Modular.to.pop() : () {},
            )
          ],
        ),
        body: Row(
          children: [
            leading,
            const Expanded(child: RouterOutlet()),
          ],
        ),
      ),
    );
  }
}
