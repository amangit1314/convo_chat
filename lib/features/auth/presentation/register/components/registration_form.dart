import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/components/text_field_input.dart';
import '../../../../../core/components/widgets.dart';
import '../../../data/controller/auth_controller.dart';
import '../../components/auth_button.dart';

class RegisterationForm extends ConsumerStatefulWidget {
  const RegisterationForm({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends ConsumerState<RegisterationForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final List<String> errors = [];

  bool _passwordVisible = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  void register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final String result =
          await ref.read<AuthController>(authControllerProvider).register(
                _emailController.text.split('@')[0],
                _emailController.text,
                _passwordController.text,
                _mobileNumberController.text,
              );

      if (result == 'success') {
        if (!mounted) return;

        Navigator.of(context)
            .push(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            )
            .then((value) => showSnackbar(
                  context,
                  Colors.green,
                  "Registration is successful 🎉",
                ));
      } else {
        if (!mounted) return;
        showSnackbar(context, Colors.red, result.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: size.height * .015),
          buildPasswordFormField(),
          SizedBox(height: size.height * .015),
          buildEnterMobileNumberFormField(),
          SizedBox(height: size.height * .035),
          AuthButton(
            onTap: register,
            name: 'Register',
          ),
        ],
      ),
    );
  }

  TextFieldInput buildPasswordFormField() {
    return TextFieldInput(
      textEditingController: _passwordController,
      hintText: 'Enter Password',
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
      isPass: _passwordVisible ? false : true,
      onSaved: (newValue) => _passwordController.text = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          removeError(error: "Please enter your password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }

        // Check for at least 1 special character
        if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          removeError(
              error: "Password must contain at least 1 special character");
        }

        // Check for at least 1 capital letter
        if (!value.contains(RegExp(r'[A-Z]'))) {
          removeError(error: "Password must contain at least 1 capital letter");
        }

        // Check for at least 1 number
        if (!value.contains(RegExp(r'[0-9]'))) {
          removeError(error: "Password must contain at least 1 number");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter your password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          addError(error: "Password must contain at least 1 special character");
          return "";
        } else if (!value.contains(RegExp(r'[A-Z]'))) {
          addError(error: "Password must contain at least 1 capital letter");
          return "";
        }
        return null;
      },
    );
  }

  TextFieldInput buildConfirmPasswordFormField() {
    return TextFieldInput(
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
        return null;
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
      textEditingController: _mobileNumberController,
      hintText: 'Mobile Number',
      labelText: 'Mobile Number',
      preIcon: const Icon(Icons.phone_android_outlined),
      contentPadding: 22,
      textInputType: TextInputType.phone,
      isPass: false,
      onSaved: (newValue) => _mobileNumberController.text = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          removeError(error: "Please Enter your number");
        } else if (value.length < 10) {
          removeError(error: "Number is too short");
        }
        return null;
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
        return null;
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
