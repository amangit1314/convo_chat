import 'package:convo_chat/components/status_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  final Widget child;

  const Home({Key? key, required this.child}) : super(key: key);

  static HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<HomeState>();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
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
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SingleChildScrollView(
                  clipBehavior: Clip.hardEdge,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      StatusItem(
                          text: "Add New",
                          avatarImg: AssetImage('assets/images/1.jpg')),
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
                          avatarImg: AssetImage('assets/images/1.jpg')),
                      StatusItem(
                          text: "Add New",
                          avatarImg: AssetImage('assets/images/2.jpg')),
                      StatusItem(
                          text: "Add New",
                          avatarImg: AssetImage('assets/images/3.jpg')),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  clipBehavior: Clip.hardEdge,
                ),
              ],
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/download.png',
                width: 200,
              ),
              const ListTile(
                leading: Icon(Icons.new_releases),
                title: Text('News'),
              ),
              const ListTile(
                leading: Icon(Icons.star),
                title: Text('Favourites'),
              ),
              const ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
