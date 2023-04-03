import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/text_field_input.dart';

// Consumer
class RegisterationForm extends StatefulWidget {
  const RegisterationForm({super.key});
// Consumer
  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

// Consumer
class _RegisterationFormState extends State<RegisterationForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  late bool _passwordVisible;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileNumberController.dispose();
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

  // void registerUser(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     AuthMethods().registerUser(
  //       context: context,
  //       email: _emailController.text,
  //       password: _passwordController.text.trim(),
  //       fullName: '',
  //     );
  //     //   .then((res) {
  //     // if (res == 'success') {
  //     //   showSnackbar(
  //     //       context, Colors.greenAccent, 'Welcome, you are registered 🥳🎉');
  //     //   Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //     //   );
  //     // } else {
  //     //   showErrorSnackBar(context, res);
  //     // }
  //     // })
  //     // String res = await ref.read(authControllerProvider).signInWithEmailAndPassword(
  //     //       context,
  //     //       _emailController.text.trim(),
  //     //       _passwordController.text.trim(),
  //     //     );
  //   }
  //   if (!mounted) return;
  //   showErrorSnackBar(context, 'Unable to validate');
  // }

  // Future<void> createUserWithEmailAndPassword(BuildContext context) async {
  //   try {
  //     await AuthMethods().registerUser(
  //       context: context,
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //       fullName: '',
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       setState(() {
  //         addError(error: 'No user found for that email.');
  //       });
  //     } else if (e.code == 'wrong-password') {
  //       setState(() {
  //         addError(error: 'Wrong password provided');
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: height * .06),
          buildPasswordFormField(),
          SizedBox(height: height * .06),
          buildEnterMobileNumberFormField(),
          SizedBox(height: height * .07),
          const RegisterButton(),
        ],
      ),
    );
  }

  TextFieldInput buildPasswordFormField() {
    return TextFieldInput(
      // textEditingController: controller.password,
      textEditingController: _passwordController,
      hintText: 'Password',
      labelText: 'Password',
      preIcon: const Icon(Icons.fingerprint),
      contentPadding: 22,
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

  TextFieldInput buildConfirmPasswordFormField() {
    return TextFieldInput(
      // textEditingController: controller.password,
      textEditingController: _confirmPasswordController,
      hintText: 'Confirm Password',
      labelText: 'Confirm Password',
      preIcon: const Icon(Icons.fingerprint),
      contentPadding: 22,
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
        } else if (value != _passwordController.text) {
          addError(error: "Password not matched!");
          return "";
        }
        return null;
      },
    );
  }

  TextFieldInput buildEnterMobileNumberFormField() {
    return TextFieldInput(
      // textEditingController: controller.password,
      textEditingController: _mobileNumberController,
      hintText: 'Confirm Password',
      labelText: 'Confirm Password',
      preIcon: const Icon(Icons.phone_android_outlined),
      contentPadding: 22,
      textInputType: TextInputType.number,
      isPass: true,
      onSaved: (newValue) => _mobileNumberController.text = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          removeError(error: "Please Enter your number");
        } else if (value.length < 10) {
          removeError(error: "Number is t00 short");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your number");
          return "";
        } else if (value.length < 10) {
          addError(error: "Number do not exist!");
          return "";
        }
        return null;
      },
    );
  }

  TextFieldInput buildEmailFormField() {
    return TextFieldInput(
      // textEditingController: controller.email,
      textEditingController: _emailController,
      preIcon: const Icon(Icons.mail),
      hintText: 'Email',
      labelText: 'Email',
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff2D2B2B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: MaterialButton(
        child: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
