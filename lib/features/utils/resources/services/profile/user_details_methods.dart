import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/models.dart';

class UserDetailsMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProfileImage(
      {required String uid, required String photoURL}) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'photoURL': photoURL});
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> addPhoneNumber(
      {required String uid, required String phoneNumber}) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'phoneNumber': phoneNumber});
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> updateUserDetailsFromProvider(String uid, UserModel user) async {
    try {
      await _firestore.collection('users').doc(uid).update(user.toMap());
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<UserModel> getUserDetails(String uid) async {
    final DocumentSnapshot<Map<String, dynamic>> snap =
        await _firestore.collection('users').doc(uid).get();
    return UserModel.fromMap(snap as Map<String, dynamic>);
  }
}
