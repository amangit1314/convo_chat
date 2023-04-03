part of 'login_bloc.dart';

@immutable
abstract class LoginStates {}

class LoginScreenLoadingState extends LoginStates {}

class LoginScreenInitialState extends LoginStates {}

class LoginScreenLoadedState extends LoginStates {}

class LoginScreenErrorState extends LoginStates {
  final String error;
  LoginScreenErrorState({required this.error});
}

class PhoneAuthCodeSentSuccess extends LoginStates {
  final String verificationId;
  // final int? token;
  PhoneAuthCodeSentSuccess({
    required this.verificationId,
    // this.token,
  });
}

class PhoneAuthCodeSentError extends LoginStates {
  final String error;
  PhoneAuthCodeSentError({required this.error});
}

class SignUpOtpSuccessState extends LoginStates {
  // final User? user;
  // SignUpOtpSuccessState({required this.user});
}
