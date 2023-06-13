import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/theme/colors.dart';
import '../../data/static_data.dart';
import 'call_notification_tile.dart';

class CallsScreen extends StatelessWidget {
  static const routeName = '/calls';
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Recent Calls",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 10,
                  ),
                  child: CallNotificationTile(
                    img: images[0],
                    name: 'Person Name',
                    time: 'Today, 9:40 PM',
                    callIcon: const FaIcon(
                      FontAwesomeIcons.video,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 10,
                  ),
                  child: CallNotificationTile(
                    img: images[1],
                    name: 'Person Name',
                    time: 'Today, 9:40 PM',
                    callIcon: const FaIcon(
                      FontAwesomeIcons.phone,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
