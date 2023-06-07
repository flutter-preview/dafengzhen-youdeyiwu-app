import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_event.dart';
import 'package:youdeyiwu_app/register/bloc/register_state.dart';

/// RegisterBloc
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>(_usernameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<VerificationCodeEvent>(_verificationCodeEvent);
    on<VerificationCodeIdEvent>(_verificationCodeIdEvent);
    on<UserAgreedEvent>(_userAgreedEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _verificationCodeEvent(
      VerificationCodeEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(verificationCode: event.verificationCode));
  }

  void _verificationCodeIdEvent(
      VerificationCodeIdEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(verificationCodeId: event.verificationCodeId));
  }

  void _userAgreedEvent(UserAgreedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userAgreed: event.userAgreed));
  }
}
