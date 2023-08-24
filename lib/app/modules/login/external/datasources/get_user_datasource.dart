import 'dart:typed_data';
import 'package:tasks/app/modules/login/infra/datasources/get_user_datasource.dart';
import '../../domain/erros/erros.dart';
import 'package:http/http.dart' as http;

class GetUserDatasource implements IGetUserDatasource {
  final http.Client httpClient;

  GetUserDatasource(this.httpClient);

  @override
  Future<Uint8List> getUser(Uint8List userProto) async {
    try {
      final uri = Uri.parse('http://localhost:5000/login');
      final request = await httpClient.post(uri, body: userProto);
      return request.bodyBytes;
    } catch (e, s) {
      throw UserDatasourceException(
          "Problem connecting to the server ${e.toString()}", s);
    }
  }
}
