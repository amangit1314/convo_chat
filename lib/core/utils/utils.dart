// // ignore_for_file: avoid_print

// import 'dart:io';

// import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// // for picking up image from gallery
// pickImage(ImageSource source) async {
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? file = await imagePicker.pickImage(source: source);
//   if (file != null) {
//     return await file.readAsBytes();
//   }
//   print('No Image Selected');
// }

// // for displaying snackbars
// showSnackBar(BuildContext context, String text) {
//   return GetSnackBar(
//     titleText: Text(
//       text,
//       style: const TextStyle(color: Colors.red),
//     ),
//   );
// }

// Future<File?> pickImageFromGallery(BuildContext context) async {
//   File? image;
//   try {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       image = File(pickedImage.path);
//     }
//   } catch (e) {
//     showSnackBar(context, e.toString());
//   }
//   return image;
// }

// Future<File?> pickVideoFromGallery(BuildContext context) async {
//   File? video;
//   try {
//     final pickedVideo =
//         await ImagePicker().pickVideo(source: ImageSource.gallery);

//     if (pickedVideo != null) {
//       video = File(pickedVideo.path);
//     }
//   } catch (e) {
//     showSnackBar(context, e.toString());
//   }
//   return video;
// }

// Future<GiphyGif?> pickGIF(BuildContext context) async {
//   GiphyGif? gif;
//   try {
//     gif = await Giphy.getGif(
//       context: context,
//       apiKey: 'pwXu0t7iuNVm8VO5bgND2NzwCpVH9S0F',
//     );
//   } catch (e) {
//     showSnackBar(context, e.toString());
//   }
//   return gif;
// }
