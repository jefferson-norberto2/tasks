import 'package:tasks/src/modules/login/domain/entities/user.dart';

abstract class IUserDatasource{
  Future<User> getUser(User user);
  Future<bool> sendUser(User user);
}