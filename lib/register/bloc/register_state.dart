class RegisterState {
  final String username;
  final String password;

  const RegisterState({
    this.username = "",
    this.password = "",
  });

  RegisterState copyWith({
    String? username,
    String? password,
  }) {
    return RegisterState(
        username: username ?? this.username,
        password: password ?? this.password);
  }
}
