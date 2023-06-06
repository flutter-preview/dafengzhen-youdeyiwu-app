abstract class RegisterEvent {
  const RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  final String username;

  const UsernameEvent(this.username);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent(this.password);
}
