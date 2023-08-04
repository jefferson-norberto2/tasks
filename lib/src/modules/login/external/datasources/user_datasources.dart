import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/src/modules/communication/socket/websocket_client.dart';
import 'package:tasks/src/modules/login/domain/entities/user.dart';
import 'package:tasks/src/modules/login/domain/erros/erros.dart';
import 'package:tasks/src/modules/login/external/adapters/user_adapter.dart';
import 'package:tasks/src/modules/login/infra/datasources/user_datasource.dart';
import 'package:http/http.dart' as http;

class UserDatasource implements IUserDatasource {
  final http.Client httpClient;
  final socket = Modular.get<WebsocketClient>();

  UserDatasource(this.httpClient);
  
  @override
  Future<User> getUser(User user) async {
    try{
      const url = 'http://localhost:5001/';
      final uri = Uri.parse('$url/login');
      final body = UserAdapter.toProtoBuffer(user);
      final request = await httpClient.post(uri, body: body);
      final sucess = UserAdapter.fromProto(request.bodyBytes);
      return sucess;
    } catch (e, s) {
      throw UserDatasourceException("Problem connecting to the server ${e.toString()}", s);
    }
  }
  
  @override
  Future<bool> sendUser(User user) async {
    try{
      const url = 'http://localhost:5001/';
      final uri = Uri.parse('$url/sign_up_user');
      final body = UserAdapter.toProtoBuffer(user);
      final request = await httpClient.post(uri, body: body);
      final sucess = jsonDecode(request.body);
      return sucess['user'];
    } catch (e, s) {
      throw UserDatasourceException("Problem connecting to the server ${e.toString()}", s);
    }
  }

  @override
  bool getUserWSC(User user, Function(dynamic) callback) {
    try{
      final body = UserAdapter.toProtoBuffer(user);
      socket.socket.emit('login', body);
      socket.socket.on('login', (data) {
        try{
          final user = UserAdapter.fromProto(data);
          callback(user);
        } catch (e) {
          callback(data);
        }
        });
      return true;
    } catch (e) {
      return false;
    }
  }

  void dispose(){
    if (socket.socket.hasListeners('login')){
      socket.socket.off('login');
    }
  }
}