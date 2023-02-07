import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/components/custom_text.dart';
import '../../../../../core/components/text_field_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _passwordVisible;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final List<String> errors = [];

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 20),
          buildPasswordFormField(),
          const SizedBox(height: 15),

          // CustomBtn(
          //   text: 'Login',
          //   press: () {
          //     AuthMethods()
          //         .loginUser(
          //           email: _emailController.text,
          //           password: _passwordController.text,
          //         )
          //         .then(
          //           (value) => Navigator.of(context).pushReplacement(
          //             MaterialPageRoute(
          //               builder: (context) => const BottomNav(),
          //             ),
          //           ),
          //         )
          //         .catchError((e) => Get.snackbar(
          //               "error",
          //               e.toString(),
          //               snackPosition: SnackPosition.BOTTOM,
          //               backgroundColor: Colors.red,
          //               colorText: Colors.white,
          //             ));
          //   },
          //   // press: () => ref.read(authRepositoryProvider).loginUser(
          //   //       context: context,
          //   //       email: _emailController.text,
          //   //       password: _passwordController.text,
          //   //     ),
          //   color: const Color(0xff2D2B2B),
          //   width: MediaQuery.of(context).size.width,
          //   height: 55,
          //   textColor: Colors.white,
          //   fontSize: 17,
          //   fontWeight: FontWeight.normal,
          //   borderRadius: 10,
          // ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff2D2B2B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: MaterialButton(
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                // AuthMethods()
                //     .loginUser(
                //       context: context,
                //       email: _emailController.text,
                //       password: _passwordController.text,
                //     )
                //     .then(
                //       (value) => Navigator.of(context).pushReplacement(
                //         MaterialPageRoute(
                //           builder: (context) => const BottomNav(),
                //         ),
                //       ),
                //     )
                //     .catchError(
                //       (e) => showErrorSnackBar(
                //         context,
                //         e.toString(),
                //       ),
                //     );
              },
            ),
          ),

          const SizedBox(height: 15),
          const MyText(text: 'forgot password?', fontSize: 13),
        ],
      ),
    );
  }

  TextFieldInput buildPasswordFormField() {
    return TextFieldInput(
      textEditingController: _passwordController,
      hintText: 'Password',
      labelText: 'Password',
      preIcon: const Icon(Icons.fingerprint),
      suffixicon: IconButton(
        icon: Icon(
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
      ),
      textInputType: TextInputType.text,
      contentPadding: 22,
      isPass: true,
      onSaved: (newValue) => _passwordController.text = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
    );
  }

  TextFieldInput buildEmailFormField() {
    return TextFieldInput(
      textEditingController: _emailController,
      preIcon: const Icon(Icons.mail),
      labelText: 'Email',
      hintText: 'Email',
      contentPadding: 22,
      textInputType: TextInputType.emailAddress,
      onSaved: (newValue) => _emailController.text = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: "Please Enter valid email");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: "Please Enter valid email");
          return "";
        }
        return null;
      },
    );
  }
}
