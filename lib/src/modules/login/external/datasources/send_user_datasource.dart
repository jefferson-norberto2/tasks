import 'dart:typed_data';
import 'package:tasks/src/modules/login/infra/datasources/send_user_datasource.dart';
import '../../domain/erros/erros.dart';
import 'package:http/http.dart' as http;

class SendUserDatasource implements ISendUserDatasource {
  final http.Client httpClient;

  SendUserDatasource(this.httpClient);
  
  @override
  Future<String> sendUser(Uint8List userProto) async {
    try{
      final uri = Uri.parse('http://localhost:5000/sign_up_user');
      final request = await httpClient.post(uri, body: userProto);
      return request.body;
    } catch (e, s) {
      throw UserDatasourceException("Problem connecting to the server ${e.toString()}", s);
    }
  }
}