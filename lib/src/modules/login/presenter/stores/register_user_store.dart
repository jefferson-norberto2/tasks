
import 'package:flutter/material.dart';
import 'package:tasks/src/modules/login/domain/usecases/send_user.dart';
import 'package:tasks/src/modules/login/presenter/states/register_user_state.dart';
import '../../domain/entities/user.dart';

class RegisterUserStore extends ValueNotifier<IRegisterUserState>{
  final ISendUser _sendUser;

  RegisterUserStore(this._sendUser) : super(EmptyRegisterUserState());

  void emit(IRegisterUserState state) => value = state;

  Future<void> registerUser(User user) async {
    emit(LoadingRegisterUserState());
    final result = await _sendUser.call(user);
    
    if(result.$2){
      emit(SucessRegisterUserState());
    } else {
      emit(ErrorRegisterUserState(result.$1.message));
    } 
  }

  Future<void> onExiteRegisterUser() async {
    emit(EmptyRegisterUserState());
  }
}