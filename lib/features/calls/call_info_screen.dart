import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/theme/colors.dart';
import '../../core/data/static_data.dart';

class CallInfoScreen extends StatelessWidget {
  const CallInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Call Info',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
        ),
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const CallsScreen()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '+91 9414777393',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Called you',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(images[0]),
                ),
                title: const Text(
                  'Person Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.indigoAccent.shade100,
                  radius: 24,
                  child: const FaIcon(
                    FontAwesomeIcons.phone,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Call Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.phone,
                  color: primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Audio Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Today, 10:00 AM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const FaIcon(
                  Icons.call_missed,
                  color: Colors.green,
                ),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.video,
                  color: Colors.black,
                  size: 20,
                ),
                title: const Text(
                  'Video Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Today, 10:00 AM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing:
                    const FaIcon(Icons.call_missed_outgoing, color: Colors.red),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.black,
                  size: 20,
                ),
                title: const Text(
                  'Audio Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Today, 10:00 AM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const FaIcon(
                  Icons.call_missed,
                  color: Colors.red,
                ),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.video,
                  color: Colors.black,
                  size: 20,
                ),
                title: const Text(
                  'Video Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Today, 10:00 AM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const FaIcon(
                  Icons.call_missed_outgoing,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
