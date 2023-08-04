import 'package:tasks/src/modules/login/domain/repositories/user_repository.dart';
import '../../../login/domain/entities/user.dart';

abstract class IGetUserWSC{
  bool call(User user, Function(dynamic) callback);
}

class GetUserWSC implements IGetUserWSC{
  final IUserRepository userRepository;

  GetUserWSC(this.userRepository);

  @override
  bool call(User user, Function(dynamic) callback) {
    if (user.name.isEmpty || user.password.isEmpty) {
      return false;
    }
    return userRepository.getUserWSC(user, callback);
  }
}