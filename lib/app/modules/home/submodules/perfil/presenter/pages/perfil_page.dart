import 'package:flutter/material.dart';
import 'package:tasks/app/modules/login/domain/entities/user.dart';

class PerfilPage extends StatelessWidget {
  final User data;
  const PerfilPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Perfil'),
                Text(data.name),
              ],),
          ],
        ),
      ),
    );
  }
}