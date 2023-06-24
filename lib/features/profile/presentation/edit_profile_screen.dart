import 'package:convo_chat/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/config/size_config.dart';
import '../../../core/utils/theme/colors.dart';
import '../../auth/data/controller/auth_controller.dart';
import '../data/controller/profile_controller.dart';
import 'profile_pic.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authControllerProvider);
    final profileProvider = ref.watch(profileControllerProvider);
    final currentUser = authProvider.getUserData();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const ProfilePic(),
          SizedBox(height: getProportionateScreenHeight(40)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                buildEditUsernameFormField(
                  _usernameController,
                  currentUser as UserModel,
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildEditEmailFormField(
                  _emailController,
                  currentUser as UserModel,
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildEditNumberFormField(
                  _phoneController,
                  currentUser as UserModel,
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await profileProvider.updateUserData(currentUser as UserModel);
                if (!mounted) return;
                Navigator.pop(context);
              }
            },
            child: Container(
              width: double.infinity,
              height: getProportionateScreenHeight(60),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "Done",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(14),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEditUsernameFormField(
      TextEditingController controller, UserModel user) {
    return TextFormField(
      style: TextStyle(
        fontSize: getProportionateScreenHeight(14),
      ),
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a username";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: user.email.split('@')[0],
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.account_circle_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orange, width: 1.0),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  TextFormField buildEditEmailFormField(
      TextEditingController controller, UserModel user) {
    return TextFormField(
      style: TextStyle(
        fontSize: getProportionateScreenHeight(14),
      ),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter an email";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: user.email.toString(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orange, width: 1.0),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  TextFormField buildEditNumberFormField(
      TextEditingController controller, UserModel user) {
    return TextFormField(
      style: TextStyle(
        fontSize: getProportionateScreenHeight(14),
      ),
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a phone number";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: user.number ?? "+91 1234567891",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orange, width: 1.0),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
