import 'dart:convert';
import 'package:tasks/src/modules/login/infra/datasources/get_user_datasource.dart';

import '../../domain/entities/user.dart';
import '../../domain/erros/erros.dart';
import '../adapters/user_adapter.dart';
import '../datasources/send_user_datasource.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepository extends IUserRepository {
  final IGetUserDatasource _getUserDatasource;
  final ISendUserDatasource _sendUserDatasource;

  UserRepository(this._getUserDatasource, this._sendUserDatasource);

  @override
  Future<(IUserException, User?)> getUser(User user) async {
    
    try{
      final request = UserAdapter.toProtoBuffer(user);
      final response = await _getUserDatasource.getUser(request);
      final userResponse = UserAdapter.fromProto(response);
      return (const UserException('No exception'), userResponse);
    } catch (e) {
      return (const UserException("Problem to get user in repository implementation"), null);
    }
  }
  
  @override
  Future<(IUserException, bool)> sendUser(User user) async {
    try{
      final request = UserAdapter.toProtoBuffer(user);
      final sucess = await _sendUserDatasource.sendUser(request);
      final decoded = jsonDecode(sucess);
      return (const UserException('No exception'), decoded['user'] as bool);
    } catch (e) {
      return (const UserException("Problem to send user, check connection"), false);
    }
  }
  
}