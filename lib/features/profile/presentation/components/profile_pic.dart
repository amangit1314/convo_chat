// ignore_for_file: unused_field

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/profile/data/controller/profile_controller.dart';
import 'package:convo_chat/models/models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth/data/controller/auth_controller.dart';

class ProfilePic extends ConsumerStatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends ConsumerState<ProfilePic> {
  bool _isImagePickerActive = false;
  Uint8List? _image;
  XFile? selectedImage;

  Future<Uint8List?> pickImage(ImageSource source) async {
    if (_isImagePickerActive) {
      return null;
    }

    _isImagePickerActive = true;

    try {
      final ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: source);
      if (file != null) {
        return await file.readAsBytes();
      }
      debugPrint('No Image Selected');
    } catch (error) {
      debugPrint('Failed to pick image: $error');
    } finally {
      _isImagePickerActive = false;
    }

    return null;
  }

  Future<String?> selectImage(
      ProfileController profileProvider, UserModel user) async {
    return pickImage(ImageSource.gallery).then((imageBytes) async {
      if (imageBytes == null || imageBytes.isEmpty) return '';

      // String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          // .child(imageName);
          .child('${user.uid}.jpg');
      // UploadTask uploadTask = storageReference.putFile(imageBytes);
      UploadTask uploadTask = storageReference.putData(imageBytes);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {
        log('Profile Image Uploaded');
      });

      String profileImage = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _image = imageBytes;
      });

      if (profileImage.isNotEmpty) {
        profileProvider.updateUserData(
          UserModel(
            uid: user.uid,
            email: user.email,
            profilePic: profileImage,
          ),
        );
        return profileImage;
      }
      return profileImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authControllerProvider);
    final profileProvider = ref.watch(profileControllerProvider);

    return FutureBuilder<UserModel?>(
      future: authProvider.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final currentUser = snapshot.data;

        return FutureBuilder<String?>(
          future: selectImage(profileProvider, currentUser!),
          builder: (context, imageSnapshot) {
            if (imageSnapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (imageSnapshot.hasError) {
              return Text('Error: ${imageSnapshot.error}');
            }
            final profilePic = imageSnapshot.data;

            final updatedUser = UserModel(
              uid: currentUser.uid,
              email: currentUser.email,
              profilePic: profilePic,
            );

            return SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
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
                  Positioned(
                    right: 5,
                    bottom: -10,
                    left: 75,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 23,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 21,
                        child: TextButton(
                          onPressed: () async {
                            profileProvider.updateUserData(updatedUser);
                            await selectImage(profileProvider, updatedUser);
                          },
                          child: SvgPicture.asset(
                            "assets/icons/Camera Icon.svg",
                            colorFilter: const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
