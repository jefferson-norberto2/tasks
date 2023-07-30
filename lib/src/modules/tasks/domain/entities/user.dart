import 'package:tasks/src/modules/tasks/domain/entities/task.dart';

class User{
  final String id;
  final String name;
  final List<Task> tasks;

  User({required this.id, required this.name, required this.tasks});
}