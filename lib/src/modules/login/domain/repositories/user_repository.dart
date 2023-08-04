import '../entities/user.dart';

abstract class IUserRepository {
  bool sendUserWSC(User user, Function(dynamic) callback);
  bool getUserWSC(User user, Function(dynamic) callback);
}