import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirestoreMethods {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> uploadImageToStorage(
    String folderName,
    Uint8List file,
    bool isCart,
  ) async {
    String res = "Some error occurred";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
        folderName,
        file,
        isCart,
      );
      res = photoUrl;
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> addUserToFirestore(
    String id,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(id).set({
        'email': email,
        'phone': phone,
        'password': password,
      });
    } catch (err) {
      Get.snackbar(
        'Error Message',
        err.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateProfile(
    String id,
    String email,
    String phone,
    String name,
    String profileImage,
  ) async {
    try {
      if (id.isEmpty) {
        throw Exception('Invalid user ID');
      }
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(id).update({
        'email': email,
        'phone': phone,
        'name': name,
        'profileImage': profileImage,
      });
    } catch (err) {
      debugPrint('Error updating profile: $err');
      Get.snackbar(
        'Error',
        'Failed to update profile: $err',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
