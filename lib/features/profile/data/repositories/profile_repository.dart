import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/common_firebase_storage_repository_provider.dart';
import '../../../../models/user_model.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(
    ref.watch(commonFirebaseStorageRepositoryProvider),
  ),
);

class ProfileRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final CommonFirebaseStorageRepository commonFirebaseStorageRepository;

  ProfileRepository(this.commonFirebaseStorageRepository)
      : auth = FirebaseAuth.instance,
        firestore = FirebaseFirestore.instance;

  CollectionReference get _users => firestore.collection('users');

  Stream<User?> get authStateChanges => auth.idTokenChanges();

  Future<UserModel?> getCurrentUserData() async {
    final userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;

    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Future updateUserData(UserModel userModel) async {
    await _users.doc(userModel.uid).update(userModel.toMap());
  }
}
