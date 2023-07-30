import '../erros/erros.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

abstract class IGetUser{
  Future<(IUserException, User?)> call(User user);
}

class GetUser implements IGetUser{
  final IUserRepository _userRepository;

  GetUser(this._userRepository);

  @override
  Future<(IUserException, User?)> call(User user) async {
    if (user.name.isEmpty || user.password.isEmpty) {
      return (const UserException('User or password is empty'), null);
    }

    return await _userRepository.getUser(user);
  }
}