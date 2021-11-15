import 'package:convo_chat/components/chat_item.dart';
import 'package:convo_chat/components/status_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_drawer.dart';

class Home extends StatefulWidget {
  final Widget child;

  const Home({Key? key, required this.child}) : super(key: key);

  static HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<HomeState>();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 225;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  late AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: HomeState.toggleDuration,
    );
  }

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/svg/nav.svg'),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.search, color: Colors.black, size: 30),
                ),
              ],
              title: const Text(
                "Messages",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: const [
                          // AddStatusItem(),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/13.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/2.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/3.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/4.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/5.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/6.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/7.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/8.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/9.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/10.jpg')),
                          StatusItem(
                              text: "Add New",
                              avatarImg: AssetImage('assets/images/11.jpg')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 10.0),
                      child: Column(
                        children: const [
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/7.jpg'),
                            personName: "Rohit Saini",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/8.jpg'),
                            personName: "Andrew Sing",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/4.jpg'),
                            personName: "Mohit Soni",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/2.jpg'),
                            personName: "Harsh Garg",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/6.jpg'),
                            personName: "Ben Stokes",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/1.jpg'),
                            personName: "Virat Kohli",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/3.jpg'),
                            personName: "Sania Mirza",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/11.jpg'),
                            personName: "Mahesh Bhat",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/12.jpg'),
                            personName: "Rony Kapoor",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/13.jpg'),
                            personName: "Amit Tandon",
                            personTime: "10:45 am",
                          ),
                          SizedBox(height: 10),
                          ChatItem(
                            lastMessage: "Hi Myself Rohit!",
                            personDpImg: AssetImage('assets/images/5.jpg'),
                            personName: "Radhe Radhe",
                            personTime: "10:45 am",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          builder: (context, child) {
            double animValue = _animationController.value;
            final slideAmount = maxSlide * animValue;
            final contentScale = 1.0 - (0.3 * animValue);
            return Stack(
              children: <Widget>[
                const MyDrawer(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slideAmount)
                    ..scale(contentScale, contentScale),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: _animationController.isCompleted ? close : null,
                    child: child,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }
}
