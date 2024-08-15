import 'dart:typed_data';
import '../../domain/erros/erros.dart';
import 'package:http/http.dart' as http;
import '../../infra/datasources/send_tasks_datasource.dart';

class SendTasksDatasource implements ISendTasksDatasource{
  final http.Client httpClient;

  SendTasksDatasource(this.httpClient);

  @override
  Future<String> sendTask(Uint8List taskProto) async {
    try{
      final uri = Uri.parse('http://localhost:10100//add_task');
      final request = await httpClient.post(uri, body: taskProto);
      return request.body;
    } catch (e, s) {
      throw TasksDatasourceErros('Problem connecting to the server ${e.toString()}', s);
    }
  }
  
}