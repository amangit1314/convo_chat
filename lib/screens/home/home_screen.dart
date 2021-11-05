import 'package:convo_chat/components/status_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/nav.svg'),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.black, size: 30),
          ),
        ],
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              clipBehavior: Clip.hardEdge,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                  StatusItem(
                      avatarImg: 'assets/convo_logo.png', text: "Add New"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Chats",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              clipBehavior: Clip.hardEdge,
              
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff617CDC),
      ),
    );
  }
}
