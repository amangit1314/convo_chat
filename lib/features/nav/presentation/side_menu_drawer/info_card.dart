import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../auth/data/controller/auth_controller.dart';

class InfoCard extends ConsumerWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.read(authControllerProvider);
    final currentUser = authProvider.getUserData();

    return FutureBuilder(
      future: currentUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final currentUser = snapshot.data;

        if (currentUser == null) {
          // Handle the case where currentUser is null
          return const Center(child: Text('User data not available.'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0), // Adjust content padding
            leading: currentUser.profilePic != null
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
            title: Text(
              currentUser.name ?? 'Convo User',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0), // Adjust top padding
              child: Text(
                currentUser.email,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
        );
      },
    );
  }
}
