// import 'package:convo_chat/domain/models/user_model.dart';
import 'package:convo_chat/data/services/auth_methods.dart';
import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_btn.dart';
import '../../../../../core/components/custom_text.dart';
import '../../../../../core/components/text_field_input.dart';

// import '../../../domain/reposittory/auth_repository.dart';
// ConsumerStatefulWidget
class RegisterationForm extends StatefulWidget {
  const RegisterationForm({super.key});
// ConsumerState
  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  late bool _passwordVisible;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final List<String> errors = [];

  // final controller = Get.put(SignUpController());

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

  void registerUser() async {
    // final user = UserModel(
    //   // email: controller.email.text.trim(),
    //   // name: controller.userName.text.trim(),
    //   // number: controller.phoneNo.text.trim(),
    //   // password: controller.password.text.trim(),
    // );

    if (formKey.currentState!.validate()) {
      // SignUpController.instance.createUser(user);

      String res = await AuthMethods().registerUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _emailController.text.trim(),
        // email: controller.email.text.trim(),
        // fullName: controller.userName.text.trim(),
        //number: controller.phoneNo.text.trim(),
        // password: controller.password.text.trim(),
      );

      if (res == 'success') {
        // await HelperFunctions.saveUserLoggedInStatus(true);
        // await HelperFunctions.saveUserEmailSF(_emailController.text);
        // await HelperFunctions.saveUserNameSF(_emailController.text.trim());
        // if (!mounted) return;
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const NavPage()),
        // );
      } else {
        // if (!mounted) return;
        // showSnackBar(context, res);
      }
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
          const SizedBox(height: 20),
          Row(
            children: const [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: MyText(text: 'forgot password?', fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomBtn(
            text: 'Register',
            press: registerUser,
            color: const Color(0xff2D2B2B),
            width: MediaQuery.of(context).size.width,
            height: 55,
            textColor: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            borderRadius: 10,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyText(
                text: 'Already have an account?',
                fontSize: 14,
              ),
              const SizedBox(width: 2),
              TextButton(
                child: const MyText(
                  text: 'Login',
                  fontSize: 14,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  TextFieldInput buildPasswordFormField() {
    return TextFieldInput(
      // textEditingController: controller.password,
      textEditingController: _passwordController,
      hintText: 'Password',
      preIcon: const Icon(CupertinoIcons.lock),
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

  TextFieldInput buildEmailFormField() {
    return TextFieldInput(
      // textEditingController: controller.email,
      textEditingController: _emailController,
      preIcon: const Icon(CupertinoIcons.mail),
      hintText: 'Email',
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
