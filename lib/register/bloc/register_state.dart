/// RegisterState
class RegisterState {
  final String username;
  final String password;
  final bool userAgreed;
  final String verificationCode;
  final String verificationCodeId;

  const RegisterState({
    this.username = "",
    this.password = "",
    this.userAgreed = false,
    this.verificationCode = "",
    this.verificationCodeId = "",
  });

  RegisterState copyWith({
    String? username,
    String? password,
    bool? userAgreed,
    String? verificationCode,
    String? verificationCodeId,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      userAgreed: userAgreed ?? this.userAgreed,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationCodeId: verificationCodeId ?? this.verificationCodeId,
    );
  }
}
