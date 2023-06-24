import 'package:cached_network_image/cached_network_image.dart';
import 'package:convo_chat/core/utils/config/size_config.dart';
import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/profile/presentation/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/user_model.dart';
import '../../auth/data/controller/auth_controller.dart';
import '../data/controller/profile_controller.dart';

class MyAccount extends ConsumerWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const TextStyle kPrimaryBoldTextStyle = TextStyle(
      fontSize: 18,
      color: primaryColor,
      fontWeight: FontWeight.w600,
    );
    final authProvider = ref.watch(authControllerProvider);
    final profileProvider = ref.watch(profileControllerProvider);
    final currentUser = authProvider.getUserData() as UserModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: primaryColor,
              ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
            child: const Text('Edit'),
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Row(
                children: [
                  currentUser.profilePic != null
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            currentUser.profilePic!,
                          ),
                          backgroundColor: primaryColor,
                        )
                      : const CircleAvatar(
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://media.sketchfab.com/models/296f9f80c4ac431aa3d354f7ef955605/thumbnails/1d824d70f65e441a8f81162ff8bac094/281cbed7656443ffb04d2e38f928ab14.jpeg',
                          ),
                          backgroundColor: primaryColor,
                        ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.email.toString().split('@')[0],
                        style: kPrimaryBoldTextStyle,
                      ),
                      Text(
                        currentUser.email,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  buildInfoRow(
                    context,
                    'Username',
                    currentUser.email.toString().split('@')[0],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Divider(
                      color: primaryColor.withOpacity(.3),
                      height: 1,
                    ),
                  ),
                  buildInfoRow(
                    context,
                    'Phone number',
                    currentUser.number ?? '+91 1234567890',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Divider(
                      color: primaryColor.withOpacity(.3),
                      height: 1,
                    ),
                  ),
                  buildInfoRow(
                    context,
                    'Email',
                    currentUser.email,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Divider(
                      color: primaryColor.withOpacity(.3),
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor.withOpacity(.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Center(
                                    child: Text(
                                      'Change Password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                    ),
                                  ),
                                  content: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(fontSize: 14),
                                      hintText: "Enter new password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.orange,
                                          width: 1.0,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 16,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      // suffixIcon: const CustomSurffixIcon(
                                      //   svgIcon: "assets/icons/Lock.svg",
                                      // ),
                                    ),
                                    onChanged: (String newPassword) =>
                                        profileProvider.updateUserData(
                                      UserModel(
                                        uid: currentUser.uid,
                                        email: currentUser.email,
                                        password: newPassword,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Change'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Change password',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(BuildContext context, String title, String value) {
    TextStyle kInfoTitleTextStyle = TextStyle(
      fontSize: 14,
      color: primaryColor.withOpacity(.8),
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kInfoTitleTextStyle,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  color: textColor,
                ),
          ),
        ],
      ),
    );
  }
}
