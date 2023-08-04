import 'package:tasks/src/modules/login/domain/entities/user.dart';
import 'package:tasks/src/modules/login/infra/datasources/user_datasource.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepository extends IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepository(this._userDatasource);
  
  @override
  bool sendUserWSC(User user, Function(dynamic) callback) {
    try{
      _userDatasource.getUserWSC(user, callback);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool getUserWSC(User user, Function(dynamic) callback) {
    try{
      _userDatasource.getUserWSC(user, callback);
      return true;
    } catch (e) {
      return false;
    }
  }
  
}