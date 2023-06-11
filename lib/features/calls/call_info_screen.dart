import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/static_data.dart';

class CallInfoScreen extends StatelessWidget {
  const CallInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Call Info',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
            children: [
              ListTile(
                subtitle: const Text('Called you'),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(images[0]),
                ),
                title: const Text(
                  'Person Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing:
                    // Row(
                    //   children: const [
                    const FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.black,
                ),
                // FaIcon(
                //   FontAwesomeIcons.video,
                //   color: Colors.black,
                // ),
                //   ],
                // ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Call Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  'Audio Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Today, 10:00 AM'),
                trailing: FaIcon(
                  Icons.call_missed,
                  color: Colors.green,
                ),
              ),
              const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.video,
                  color: Colors.black,
                ),
                title: Text(
                  'Video Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Today, 10:00 AM'),
                trailing: FaIcon(Icons.call_missed_outgoing, color: Colors.red),
              ),
              const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  'Audio Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Today, 10:00 AM'),
                trailing: FaIcon(
                  Icons.call_missed,
                  color: Colors.red,
                ),
              ),
              const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.video,
                  color: Colors.black,
                ),
                title: Text(
                  'Video Call',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Today, 10:00 AM'),
                trailing: FaIcon(
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
