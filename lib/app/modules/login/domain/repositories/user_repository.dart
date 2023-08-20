import '../entities/user.dart';
import '../erros/erros.dart';

abstract class IUserRepository {
  Future<(IUserException, User?)> getUser(User user);
  Future<(IUserException, bool)> sendUser(User user);
}