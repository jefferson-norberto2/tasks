import '../entities/user.dart';
import '../repositories/user_repository.dart';

abstract class ISendUserWsc {
  bool call(User user, Function(dynamic) callback);
}

class SendUserWsc implements ISendUserWsc {
  final IUserRepository _userRepository;

  SendUserWsc(this._userRepository);

  @override
  bool call(User user, Function(dynamic) callback) {
    if (user.name.isEmpty || user.password.isEmpty) {
      return false;
    }

    return _userRepository.sendUserWSC(user, callback);
  }
}