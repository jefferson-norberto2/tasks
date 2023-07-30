
import 'package:flutter/material.dart';
import 'package:tasks/src/modules/login/domain/usecases/get_user.dart';
import 'package:tasks/src/modules/login/presenter/states/login_state.dart';
import '../../domain/entities/user.dart';

class LoginStore extends ValueNotifier<ILoginState>{
  final IGetUser _getUser;

  LoginStore(this._getUser) : super(EmptyLoginState());

  void emit(ILoginState state) => value = state;

  Future<void> login(User user) async {
    emit(LoadingLoginState());
    final result = await _getUser.call(user);
    
    result.$2 == null ? emit(ErrorLoginState(result.$1.message)) : emit(SucessLoginState(result.$2!));
  }

  void onExitLoginPage() {
    emit(EmptyLoginState());
  }
}