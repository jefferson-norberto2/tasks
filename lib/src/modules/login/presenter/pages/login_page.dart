import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/login/presenter/states/login_state.dart';
import '../../domain/entities/user.dart';
import '../stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<LoginStore>();
    final state = store.value;
    final editTextName = TextEditingController(text: "");
    final editTextPassword = TextEditingController(text: "");
    
    Widget child = Container();

    if (state is LoadingLoginState){
      child = const CircularProgressIndicator();
    } else if (state is ErrorLoginState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Error", message: state.message, isAError: true);
      });
    } else if (state is SucessLoginState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Modular.to.pushNamed('/task_module/', arguments: state.user);
      });
    }

    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editTextName,
              decoration: const InputDecoration(
                labelText: 'User',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: editTextPassword,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 40)
              ),
              onPressed: () {
                store.login(User(name: editTextName.text, password: editTextPassword.text));
              },
              child: const Text('Entrar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 40)
              ),
              onPressed: () {
                Modular.to.pushNamed('/register_user/');
              },
              child: const Text('Cadastre-se'),
            ),
          ),
          child
        ],
      ),));
  }

  void onExit(LoginStore store){
    store.onExitLoginPage();
    Modular.to.pushNamed('/home');
  }

  void _showMyDialog({required String title, required String message, bool isAError = false}) {
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
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}