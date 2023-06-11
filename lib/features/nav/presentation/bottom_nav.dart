import 'dart:math';

import 'package:convo_chat/features/nav/presentation/components/side_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/data.dart';
import '../models/rive_asset.dart';
import 'components/menu_drawer_button.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottomNav';
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  bool isSideMenuClosed = true;
  RiveAsset selectedBottomNav = bottomNavs.first;
  late int _selected = 0;

  late bool _isAnimating;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _isAnimating = false;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    super.initState();
  }

  void close() => _animationController.reverse();

  void open() {
    _animationController.forward();
    setState(() {
      _isAnimating = true;
    });
  }

  void toggleDrawer() {
    _animationController.isCompleted ? close() : open();
    _isAnimating = !_isAnimating;
  }

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
          _isAnimating = !_isAnimating;
          close();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff22211F),
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: const SideMenuDrawer(),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          _animationController.isCompleted ? 24 : 0),
                      child: pages[_selected],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 15,
              left: isSideMenuClosed ? 13 : 228,
              curve: Curves.fastOutSlowIn,
              child: MenuDrawerButton(
                isOpened: isSideMenuClosed,
                svgIcon: isSideMenuClosed
                    ? 'assets/svg/nav.svg'
                    : 'assets/svg/close.svg',
                press: () {
                  isSideMenuClosed ? open() : close();
                  setState(() {
                    isSideMenuClosed = !isSideMenuClosed;
                  });
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _selected = 0;
                        })
                      },
                      child: FaIcon(
                        FontAwesomeIcons.facebookMessenger,
                        color: _selected == 0
                            ? const Color.fromARGB(255, 125, 95, 206)
                            : Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _selected = 1;
                        })
                      },
                      child: FaIcon(
                        FontAwesomeIcons.peopleGroup,
                        color: _selected == 1
                            ? const Color.fromARGB(255, 125, 95, 206)
                            : Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _selected = 2;
                        })
                      },
                      child: FaIcon(
                        FontAwesomeIcons.mobile,
                        color: _selected == 2
                            ? const Color.fromARGB(255, 125, 95, 206)
                            : Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _selected = 3;
                        })
                      },
                      child: FaIcon(
                        FontAwesomeIcons.circleUser,
                        color: _selected == 3
                            ? const Color.fromARGB(255, 125, 95, 206)
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
