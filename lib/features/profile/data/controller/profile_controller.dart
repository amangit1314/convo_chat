import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/user_model.dart';
import '../repositories/profile_repository.dart';

final profileControllerProvider = Provider<ProfileController>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return ProfileController(profileRepository: profileRepository, ref: ref);
});

class ProfileController {
  final ProfileRepository profileRepository;
  final ProviderRef ref;

  ProfileController({
    required this.profileRepository,
    required this.ref,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await profileRepository.getCurrentUserData();
    return user;
  }

  Future updateUserData(UserModel userModel) async {
    await profileRepository.updateUserData(userModel);
  }
}
