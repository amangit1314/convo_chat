import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../../models/user_model.dart';
import '../../../auth/data/controller/auth_controller.dart';

class InfoCard extends ConsumerWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authControllerProvider);
    final currentUser = authProvider.getUserData() as UserModel;
    return ListTile(
      leading: currentUser.profilePic != null
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
      title: Text(
        currentUser.name ?? 'Convo User',
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        currentUser.email,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
