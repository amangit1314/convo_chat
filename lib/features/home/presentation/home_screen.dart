import 'package:convo_chat/features/home/presentation/components/body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
  final VoidCallback? onTap;
  const HomeScreen({super.key, this.onTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // StreamChatCore.of(context).client.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // leading: GestureDetector(
        //   onTap: widget.onTap,
        //   child: CircleAvatar(
        //     radius: 20,
        //     backgroundColor: Colors.white,
        //     child: Center(
        //         child: SvgPicture.asset(
        //       'assets/svg/nav.svg',
        //       height: 19,
        //     )),
        //   ),
        // ),

        actions: [
          PopupMenuButton<int>(
            icon: const FaIcon(
              FontAwesomeIcons.sortDown,
              color: Colors.black,
              size: 20,
            ),
            splashRadius: 20,
            itemBuilder: (context) => [
              PopupMenuItem(child: const Text('Add Group'), onTap: () {}),
              PopupMenuItem(child: const Text('Add Story'), onTap: () {}),
              PopupMenuItem(child: const Text('Settings'), onTap: () {}),
            ],
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
