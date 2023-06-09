/// LoginEvent
abstract class LoginEvent {
  const LoginEvent();
}

/// UsernameEvent
class UsernameEvent extends LoginEvent {
  final String username;

  const UsernameEvent(this.username);
}

/// PasswordEvent
class PasswordEvent extends LoginEvent {
  final String password;

  const PasswordEvent(this.password);
}

/// VerificationCodeEvent
class VerificationCodeEvent extends LoginEvent {
  final String verificationCode;

  const VerificationCodeEvent(this.verificationCode);
}

/// VerificationCodeIdEvent
class VerificationCodeIdEvent extends LoginEvent {
  final String verificationCodeId;

  const VerificationCodeIdEvent(this.verificationCodeId);
}
