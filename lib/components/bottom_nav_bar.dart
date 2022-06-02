import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BottomItems {
  Chats,
  Groups,
  Calls,
  Profile,
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final BottomItems _selectedItem = BottomItems.Chats;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .95,
      height: MediaQuery.of(context).size.height * .1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color.fromARGB(255, 19, 19, 19),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                BottomItems.Chats;
              });
            },
            child: _selectedItem == BottomItems.Chats
                ? isActiveWidget("Chats")
                : const FaIcon(
                    FontAwesomeIcons.facebookMessenger,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                BottomItems.Chats;
              });
            },
            child: _selectedItem == BottomItems.Groups
                ? isActiveWidget("Groups")
                : const FaIcon(
                    FontAwesomeIcons.users,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                BottomItems.Groups;
              });
            },
            child: _selectedItem == BottomItems.Calls
                ? isActiveWidget("Explore")
                : const FaIcon(
                    FontAwesomeIcons.mobile,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                BottomItems.Calls;
              });
            },
            child: _selectedItem == BottomItems.Chats
                ? isActiveWidget("Explore")
                : const FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }

  Widget isActiveWidget(String title) {
    return Column(
      children: [
        FadeIn(
          delay: const Duration(milliseconds: 100),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        FadeInLeft(
          from: 15,
          child: const SizedBox(
            height: 3,
            width: 30,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: 1,
              color: Color(0xFF733FF1),
              backgroundColor: Color(0xff202032),
            ),
          ),
        ),
      ],
    );
  }
}
