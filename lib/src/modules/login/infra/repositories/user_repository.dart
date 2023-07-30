import 'package:tasks/src/modules/login/domain/entities/user.dart';
import 'package:tasks/src/modules/login/domain/erros/erros.dart';
import 'package:tasks/src/modules/login/infra/datasources/user_datasource.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepository extends IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepository(this._userDatasource);

  @override
  Future<(IUserException, User?)> getUser(User user) async {
    
    try{
      final sucess = await _userDatasource.getUser(user);
      return (const UserException('No exception'), sucess);
    } catch (e) {
      return (const UserException("Problem to get user in repository implementation"), null);
    }
  }
  
  @override
  Future<(IUserException, bool)> sendUser(User user) async {
    try{
      final sucess = await _userDatasource.sendUser(user);
      return (const UserException('No exception'), sucess);
    } catch (e) {
      return (const UserException("Problem to send user, check connection"), false);
    }
  }
  
}