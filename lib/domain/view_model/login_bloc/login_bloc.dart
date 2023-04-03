import 'package:bloc/bloc.dart';
import 'package:convo_chat/data/repository/authModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  String loginResult = '';
  AuthModel authModel = AuthModel();
  UserCredential? userCredential;

  LoginBloc(super.initialState) {
    on<SendOtpToPhoneEvent>((event, emit) async {
      // authModel.loginWithNumber(
      //   phoneNumber: event.phoneNumber,
      //   onVerificationCompleted: (PhoneAuthCredential credential) async {
      //     userCredential = (await authModel.signInWithPhoneNumber(
      //             credential.smsCode!, credential.verificationId!))
      //         as UserCredential?;
      //     if (userCredential != null) {
      //       emit(LoginSuccessState());
      //     } else {
      //       emit(LoginFailedState());
      //     }
      //   },
      //   onVerificationFailed: (FirebaseAuthException e) {
      //     emit(LoginFailedState());
      //   },
      //   codeSent: (String verificationId, int? resendToken) {
      //     emit(LoginOtpSentState());
      //   },
      //   codeAutoRetrievalTimeout: (String verificationId) {
      //     emit(LoginOtpSentState());
      //   },
      // )
      emit(LoginScreenLoadedState());
      try {
        await authModel.loginWithNumber(
            phoneNumber: event.phoneNumber,
            onVerificationCompleted: (PhoneAuthCredential credentials) {
              add(OnPhoneAuthVerificationCompleted(credential: credentials));
            },
            onVerificationFailed: (FirebaseAuthException e) {
              add(OnPhoneAuthErrorEvent(error: e.toString()));
            },
            codeSent: (String verificationId, int? refereshToken) {
              add(OnOtpSend(
                  verificationId: verificationId, token: refereshToken));
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      } catch (e) {
        emit(LoginScreenErrorState(error: e.toString()));
      }
    });

    on<OnOtpSend>((event, emit) async {
      emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId));
    });

    on<VerifySentOtp>(((event, emit) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId, smsCode: event.otp);
        add(OnPhoneAuthVerificationCompleted(credential: credential));
      } catch (e) {
        emit(LoginScreenErrorState(error: e.toString()));
      }
    }));

    on<OnPhoneAuthErrorEvent>(((event, emit) {
      emit(LoginScreenErrorState(error: event.error.toString()));
    }));

    on<OnPhoneAuthVerificationCompleted>(((event, emit) async {
      try {
        await authModel.auth
            .signInWithCredential(event.credential)
            .then((value) {
          emit(SignUpOtpSuccessState());
          emit(LoginScreenLoadedState());
        });
      } catch (e) {
        emit(LoginScreenErrorState(error: e.toString()));
      }
    }));
  }
}
