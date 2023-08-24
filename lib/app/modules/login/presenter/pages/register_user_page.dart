import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/app/modules/login/presenter/states/register_user_state.dart';
import 'package:tasks/app/modules/login/presenter/stores/register_user_store.dart';
import '../../domain/entities/user.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<RegisterUserStore>();
    final state = store.value;
    final editTextName = TextEditingController(text: "");
    final editTextPassword = TextEditingController(text: "");

    bool isLoading = state is LoadingRegisterUserState;

    if (state is ErrorRegisterUserState) {
      //To do a alert dialog
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Error", message: state.message, isAError: true);
      });
    } else if (state is SucessRegisterUserState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(
            title: "Success", message: "User Registered", store: store);
      });
    }

    return SafeArea(
      child: Scaffold(
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
                controller: editTextPassword,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      store.registerUser(User(
                          name: editTextName.text,
                          password: editTextPassword.text));
                    },
                    child: const Text('Cadastrar',
                        style: TextStyle(color: Colors.green)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onExit(store);
                    },
                    child:
                        const Text('Exit', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  void onExit(RegisterUserStore store) {
    store.onExiteRegisterUser();
    Modular.to.pop();
  }

  void _showMyDialog(
      {required String title,
      required String message,
      bool isAError = false,
      RegisterUserStore? store}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title,
              style: TextStyle(color: isAError ? Colors.red : Colors.black)),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isAError == false) {
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
