import 'package:convo_chat/core/components/loading_widget.dart';
import 'package:convo_chat/core/utils/utils.dart';
import 'package:convo_chat/domain/view_model/login_bloc/login_bloc.dart';
import 'package:convo_chat/features/auth/presentation/otp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenerateOtpScreen extends ConsumerStatefulWidget {
  static const routeName = '/generateOtpScreen';
  const GenerateOtpScreen({super.key});

  @override
  ConsumerState<GenerateOtpScreen> createState() => _GenerateOtpScreenState();
}

class _GenerateOtpScreenState extends ConsumerState<GenerateOtpScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneNoController = TextEditingController();
  late TextEditingController otpController = TextEditingController();
  LoginBloc loginBloc = LoginBloc(LoginScreenInitialState());

  @override
  void dispose() {
    super.dispose();
    phoneNoController.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Generate OTP',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Container(
                height: 240,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/forOtp.png'),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const Text(
                'Enter Mobile Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  'Enter your mobile number below to get OTP ',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: TextFormField(
                        key: formKey,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          decorationColor: Colors.black,
                          fontSize: 18,
                        ),
                        controller: phoneNoController,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 14.0),
                            child: FaIcon(Icons.phone,
                                color: Colors.deepPurpleAccent),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Enter Mobile Number...',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    loginBloc.add(
                      SendOtpToPhoneEvent(phoneNumber: phoneNoController.text),
                    );
                  }
                },
                child: BlocConsumer<LoginBloc, LoginStates>(
                  listener: (context, state) {
                    if (state is LoginScreenLoadedState) {
                      Navigator.of(context)
                          .pushNamed(VerifyOtpScreen.routeName);
                    } else if (state is LoginScreenErrorState) {
                      showErrorSnackBar(context, state.error.toString());
                    } else if (state is PhoneAuthCodeSentSuccess) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Please Enter OTP'),
                              content: TextField(
                                controller: otpController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter OTP',
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    loginBloc.add(
                                      VerifySentOtp(
                                          otp: otpController.text,
                                          verificationId: state.verificationId),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginScreenLoadingState) {
                      return const LoadingWidget(
                          isCenter: true, color: Colors.deepOrangeAccent);
                    }
                    return const Text(
                      'Send OTP',
                      style: TextStyle(color: Colors.deepPurpleAccent),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
