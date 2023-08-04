
import 'package:flutter/material.dart';
import 'package:tasks/src/modules/login/domain/usecases/send_user_wsc.dart';
import 'package:tasks/src/modules/login/presenter/states/register_user_state.dart';
import '../../domain/entities/user.dart';

class RegisterUserStore extends ValueNotifier<IRegisterUserState>{
  final ISendUserWsc _sendUser;

  RegisterUserStore(this._sendUser) : super(EmptyRegisterUserState());

  void emit(IRegisterUserState state) => value = state;

  Future<void> registerUser(User user) async {
    emit(LoadingRegisterUserState());
    
    if(!_sendUser.call(user, (data) {
      if (data == 'User not found') {
        emit(ErrorRegisterUserState(data));
      }else {
        emit(SucessRegisterUserState());
      }
    })){
      emit(ErrorRegisterUserState('User or password empty'));
    }
  }

  Future<void> onExiteRegisterUser() async {
    emit(EmptyRegisterUserState());
  }
}