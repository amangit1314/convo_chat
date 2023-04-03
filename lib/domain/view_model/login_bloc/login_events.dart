part of 'login_bloc.dart';

@immutable
abstract class LoginEvents {}

class SendOtpToPhoneEvent extends LoginEvents {
  final String phoneNumber;
  SendOtpToPhoneEvent({required this.phoneNumber});
}

class OnOtpSend extends LoginEvents {
  final String verificationId;
  final int? token;
  OnOtpSend({
    required this.verificationId,
    this.token,
  });
}

class VerifySentOtp extends LoginEvents {
  final String otp;
  final String verificationId;
  VerifySentOtp({
    required this.otp,
    required this.verificationId,
  });
}

class OnPhoneAuthErrorEvent extends LoginEvents {
  final String error;
  OnPhoneAuthErrorEvent({required this.error});
}

class OnPhoneAuthVerificationCompleted extends LoginEvents {
  final PhoneAuthCredential credential;
  OnPhoneAuthVerificationCompleted({required this.credential});
}
