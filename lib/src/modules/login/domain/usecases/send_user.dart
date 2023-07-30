import '../entities/user.dart';
import '../erros/erros.dart';
import '../repositories/user_repository.dart';

abstract class ISendUser {
  Future<(IUserException, bool)> call(User user);
}

class SendUser implements ISendUser {
  final IUserRepository _userRepository;

  SendUser(this._userRepository);

  @override
  Future<(IUserException, bool)> call(User user) async {
    if (user.name.isEmpty || user.password.isEmpty) {
      return (const UserException('User or password is empty'), false);
    }

    return await _userRepository.sendUser(user);
  }
}