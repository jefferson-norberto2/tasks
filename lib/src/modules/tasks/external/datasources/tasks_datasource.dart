import 'dart:convert';
import 'package:tasks/src/modules/tasks/domain/entities/task.dart';
import 'package:tasks/src/modules/tasks/domain/erros/erros.dart';
import 'package:tasks/src/modules/tasks/external/adapters/task_adapter.dart';
import 'package:tasks/src/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:http/http.dart' as http;
import '../adapters/user_adapter.dart';

class TasksDatasource implements ITasksDatasource{
  final http.Client httpClient;

  TasksDatasource(this.httpClient);
  
  @override
  Future<List<Task>> getTasks(String id) async {
    try{
      const url = 'http://localhost:5000/';
      final uri = Uri.parse('$url/get_tasks');
      final body = id;
      final request = await httpClient.post(uri, body: body);
      final user = UserAdapter.fromProto(request.bodyBytes);
      return user.tasks; 
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }

  }

  @override
  Future<bool> sendTask(Task task) async {
    try{
      const url = 'http://localhost:5000/';
      final uri = Uri.parse('$url/add_task');
      final body = TaskAdapter.toProtoBuffer(task);
      final request = await httpClient.post(uri, body: body);
      final sucess = jsonDecode(request.body);
      return sucess['user'];
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }
  }
  
}