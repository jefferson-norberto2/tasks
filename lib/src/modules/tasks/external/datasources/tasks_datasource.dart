import 'package:tasks/src/modules/tasks/domain/entities/task.dart';
import 'package:tasks/src/modules/tasks/domain/erros/erros.dart';
import 'package:tasks/src/modules/tasks/external/adapters/task_adapter.dart';
import 'package:tasks/src/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class TasksDatasource implements ITasksDatasource{
  final io.Socket socket;
  final List<Task> tasks = [];

  TasksDatasource(this.socket);
    
  @override
  Future<List<Task>> getTasks(String id) async {
    try{

      // const url = 'http://localhost:5000/chat';
      // // final uri = Uri.parse('$url/get_tasks');
      // // final body = id;
      // var request;
      // socket.on('ticket', (data) => null);
      // final request = await httpClient.post(uri, body: body);
      // final user = UserAdapter.fromProto(request.bodyBytes);
      if(tasks.isEmpty){
        receiveTasks();
      }
      return tasks; 
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }
  }

  void receiveTasks() {
    socket.emit('tasks', '1');
    socket.on('tasks', (data) {
      // final task = TaskAdapter.fromProto(data);
      // try{
      // final user = UserAdapter.fromProto(data);
      // } catch(e) {
      //   print(e);
      // }
      
      tasks.add(Task(id: '1', task: 'Tarefa', userId: '1'));
    });
  }

  @override
  Future<bool> sendTask(Task task) async {
    try{
      final body = TaskAdapter.toProtoBuffer(task);
      socket.emit('add_task', body);
      return true;
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }
  }
  
}