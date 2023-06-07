/// RegisterEvent
abstract class RegisterEvent {
  const RegisterEvent();
}

/// UsernameEvent
class UsernameEvent extends RegisterEvent {
  final String username;

  const UsernameEvent(this.username);
}

/// PasswordEvent
class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent(this.password);
}

/// VerificationCodeEvent
class VerificationCodeEvent extends RegisterEvent {
  final String verificationCode;

  const VerificationCodeEvent(this.verificationCode);
}

/// VerificationCodeIdEvent
class VerificationCodeIdEvent extends RegisterEvent {
  final String verificationCodeId;

  const VerificationCodeIdEvent(this.verificationCodeId);
}

/// UserAgreedEvent
class UserAgreedEvent extends RegisterEvent {
  final bool userAgreed;

  const UserAgreedEvent(this.userAgreed);
}
