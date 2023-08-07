import 'dart:typed_data';
import 'package:tasks/src/modules/tasks/domain/erros/erros.dart';
import 'package:http/http.dart' as http;
import '../../infra/datasources/get_tasks_datasource.dart';

class GetTasksDatasource implements IGetTasksDatasource{
  final http.Client httpClient;

  GetTasksDatasource(this.httpClient);
  
  @override
  Future<Uint8List> getTasks(String id) async {
    try{
      final uri = Uri.parse('http://localhost:5000/get_tasks');
      final request = await httpClient.post(uri, body: id);
      return request.bodyBytes; 
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }

  }
  
}