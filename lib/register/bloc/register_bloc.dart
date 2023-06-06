import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_event.dart';
import 'package:youdeyiwu_app/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>(_userNameEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _userNameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
