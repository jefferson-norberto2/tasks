
import 'package:flutter/material.dart';
import 'package:tasks/src/modules/login/domain/usecases/get_user_wsc.dart';
import 'package:tasks/src/modules/login/presenter/states/login_state.dart';
import '../../domain/entities/user.dart';

class LoginStore extends ValueNotifier<ILoginState>{
  final IGetUserWSC _getUserWSC;

  LoginStore(this._getUserWSC) : super(EmptyLoginState());

  void emit(ILoginState state) => value = state;

  Future<void> loginWSC(User user) async {
    emit(LoadingLoginState());
    
    if(!_getUserWSC.call(user, (data) {
      if (data == 'User not found') {
        emit(ErrorLoginState(data));
      }else {
        emit(SucessLoginState(data));
      }
    })){
      emit(ErrorLoginState('User or password empty'));
    }
  }

  void onExitLoginPage() {
    emit(EmptyLoginState());
  }
}