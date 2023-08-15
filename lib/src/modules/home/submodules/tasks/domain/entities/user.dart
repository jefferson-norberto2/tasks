import 'task.dart';

class User{
  final String id;
  final String name;
  final List<Task> tasks;

  User({required this.id, required this.name, required this.tasks});
}