import 'package:flutter/material.dart';

class SelectedStoryScreen extends StatelessWidget {
  final String? image;
  final String? video;
  final String username;
  final int time;

  const SelectedStoryScreen({
    Key? key,
    this.image,
    this.video,
    this.username = 'Convo User',
    this.time = 0,
  }) : super(key: key);

  double calculateContainerWidth(int itemCount) {
    if (itemCount > 0) {
      return 1.0 / itemCount;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemCount = time; // Use provided time as the itemCount

    Widget backgroundWidget;
    if (image != null) {
      backgroundWidget = Image.asset(
        image!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else if (video != null) {
      // Use video widget for video background
      // Replace the VideoWidget with the actual widget for playing videos
      backgroundWidget = VideoWidget(videoUrl: video!);
    } else {
      backgroundWidget =
          Container(); // Empty container if neither image nor video is provided
    }

    return Scaffold(
      backgroundColor: Colors.transparent, // Set background to transparent
      body: Stack(
        children: [
          backgroundWidget,
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 2,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 4);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: size.width * calculateContainerWidth(itemCount),
                        color: Colors.white,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                image ?? 'assets/images/placeholder.jpg'),
                            radius: 24,
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              Text(
                                username,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${time}m',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.cancel_outlined,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  final String videoUrl;

  const VideoWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // Implement your video player widget here
    // Replace this with the actual widget for playing videos
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black, // Placeholder color for video background
      child: const Text(
        'Video Player',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
