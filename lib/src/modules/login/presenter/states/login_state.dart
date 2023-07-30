
import '../../domain/entities/user.dart';

abstract class ILoginState {
}

class SucessLoginState implements ILoginState {
  final User user;

  SucessLoginState(this.user);
}

class EmptyLoginState extends ILoginState{
}

class ErrorLoginState extends ILoginState{
  final String message;

  ErrorLoginState(this.message);
}

class LoadingLoginState extends ILoginState{}