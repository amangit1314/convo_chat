// ignore_for_file: unused_field

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convo_chat/models/models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/theme/colors.dart';
import '../../auth/data/controller/auth_controller.dart';
import '../data/controller/profile_controller.dart';

class ProfilePic extends ConsumerStatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends ConsumerState<ProfilePic> {
  bool _isImagePickerActive = false;
  Uint8List? _image;
  XFile? selectedImage;

  pickImage(ImageSource source) async {
    if (_isImagePickerActive) {
      return;
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
  }

  selectImage(ProfileController profileProvider, UserModel user) async {
    Uint8List imageBytes = await pickImage(ImageSource.gallery) ?? Uint8List(0);
    if (imageBytes.isEmpty) return;

    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('profile_images').child(imageName);

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
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authControllerProvider);
    final profileProvider = ref.watch(profileControllerProvider);
    final currentUser = authProvider.getUserData() as UserModel;
    final updatedUser = UserModel(
      uid: currentUser.uid,
      email: currentUser.email,
      profilePic: selectImage(profileProvider, currentUser),
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
                  ), // Cast AssetImage to ImageProvider
                  backgroundColor: primaryColor,
                )
              : const CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://media.sketchfab.com/models/296f9f80c4ac431aa3d354f7ef955605/thumbnails/1d824d70f65e441a8f81162ff8bac094/281cbed7656443ffb04d2e38f928ab14.jpeg',
                  ), // Cast AssetImage to ImageProvider
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
          )
        ],
      ),
    );
  }
}
