import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks/src/modules/login/domain/entities/user.dart';
import 'package:tasks/src/modules/login/domain/erros/erros.dart';
import 'package:tasks/src/modules/login/domain/repositories/user_repository.dart';
import 'package:tasks/src/modules/login/domain/usecases/get_user.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  final repository = MockUserRepository();
  final usecase = GetUser(repository);

  test('get user ...', () async {
    final user = User(name: "user", password: "password");
    when(() => repository.getUser(user)).thenAnswer((_) async => (const UserException('No exception'), user));
    
    final result = await usecase.call(user);

    expect(result, const TypeMatcher<(IUserException, User?)>());
    expect(result.$1.message, "No exception");
  });

  test('User name empty...', () async {
    final user = User(name: "", password: "password");
    final result = await usecase.call(user);

    expect(result, const TypeMatcher<(IUserException, bool)>());
    expect(result.$1.message, "User or password is empty");
    expect(result.$2, false);
  });

  test('User password empty...', () async {
    final user = User(name: "user", password: "");
    final result = await usecase.call(user);

    expect(result, const TypeMatcher<(IUserException, bool)>());
    expect(result.$1.message, "User or password is empty");
    expect(result.$2, false);
  });

}