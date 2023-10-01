import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../nav/presentation/bottom_nav.dart';

class CustomChatAppBar extends StatelessWidget {
  final String imgAssetUrl;
  final String username;
  final String time;
  const CustomChatAppBar({super.key, required this.imgAssetUrl, required this.username, required this.time});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 0,
        color: primaryLightColor,
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const BottomNav(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 6),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: popColor,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(imgAssetUrl),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.indigoAccent.shade400.withOpacity(.8)),
                        ),
                        Text(
                          'Last active at $time',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: textColor,
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.video,
                      size: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.phone,
                      size: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
