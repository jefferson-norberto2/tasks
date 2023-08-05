import 'dart:convert';
import '../../domain/entities/task.dart' show Task;
import '../../domain/erros/erros.dart' show TasksDatasourceErros;
import '../adapters/task_adapter.dart' show TaskAdapter;
import '../../infra/datasources/tasks_datasource.dart' show ITasksDatasource;
import 'package:http/http.dart' as http;
import '../adapters/user_adapter.dart' show UserAdapter;

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