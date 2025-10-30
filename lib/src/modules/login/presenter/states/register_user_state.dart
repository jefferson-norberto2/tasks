abstract class IRegisterUserState {}

class SucessRegisterUserState implements IRegisterUserState {}

class EmptyRegisterUserState extends IRegisterUserState {}

class ErrorRegisterUserState extends IRegisterUserState {
  final String message;

  ErrorRegisterUserState(this.message);
}

class LoadingRegisterUserState extends IRegisterUserState {}
