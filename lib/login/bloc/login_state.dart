/// LoginState
class LoginState {
  final String username;
  final String password;
  final String verificationCode;
  final String verificationCodeId;

  const LoginState({
    this.username = "",
    this.password = "",
    this.verificationCode = "",
    this.verificationCodeId = "",
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? verificationCode,
    String? verificationCodeId,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationCodeId: verificationCodeId ?? this.verificationCodeId,
    );
  }
}
