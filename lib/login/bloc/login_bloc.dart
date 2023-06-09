import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/login/bloc/login_event.dart';
import 'package:youdeyiwu_app/login/bloc/login_state.dart';

/// LoginBloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<UsernameEvent>(_usernameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<VerificationCodeEvent>(_verificationCodeEvent);
    on<VerificationCodeIdEvent>(_verificationCodeIdEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _verificationCodeEvent(
      VerificationCodeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(verificationCode: event.verificationCode));
  }

  void _verificationCodeIdEvent(
      VerificationCodeIdEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(verificationCodeId: event.verificationCodeId));
  }
}
