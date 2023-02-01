import 'dart:math';

import 'package:convo_chat/features/nav/presentation/components/side_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/utils/rive_utils.dart';
import '../data/data.dart';
import '../models/rive_asset.dart';
import 'components/menu_drawer_button.dart';
import 'components/sliding_indicator.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  bool isSideMenuClosed = true;
  RiveAsset selectedBottomNav = bottomNavs.first;

  // purane code se
  late bool _isAnimating;

  // flutter way video wala
  // late SMIBool isSideBarClosed;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  // late TabController tabController;

  @override
  void initState() {
    // isSideBarClosed =

    _isAnimating = false;

    // tabController = TabController(length: 3, vsync: this);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {
          // isSideMenuClosed = _animationController.isCompleted;
        });
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
    // tabController.dispose();
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
      // child: AnimatedBuilder(
      //   animation: _animationController,
      // builder: ((context, child) {
      //   return Stack(
      //     children: [
      //       // Drawer
      //       AnimatedPositioned(
      //         duration: const Duration(milliseconds: 200),
      //         curve: Curves.fastOutSlowIn,
      //         width: 288,
      //         left: isSideMenuClosed ? -288 : 0,
      //         height: MediaQuery.of(context).size.height,
      //         child: const SideMenuDrawer(),
      //       ),
      //       // Screen
      //       Transform(
      //         alignment: Alignment.center,
      //         transform: Matrix4.identity()
      //           ..setEntry(3, 2, 0.001)
      //           ..rotateY(animation.value - 30 * animation.value * pi / 180),
      //         child: Transform.translate(
      //           offset: Offset(animation.value * 265, 0),
      //           // offset: Offset(isSideMenuClosed ? 0 : 288, 0),
      //           child: Transform.scale(
      //             // scale: isSideMenuClosed ? 1 : 0.7,
      //             scale: scaleAnimation.value,
      //             child: GestureDetector(
      //               onTap: _animationController.isCompleted ? close : null,
      //               child: ClipRRect(
      //                 borderRadius: _animationController.isCompleted
      //                     ? const BorderRadius.all(Radius.circular(0))
      //                     : const BorderRadius.all(Radius.circular(24)),
      //                 child: child,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       // Menu Button
      //       AnimatedPositioned(
      //         duration: const Duration(milliseconds: 200),
      //         top: 15,
      //         left: isSideMenuClosed ? 13 : 220,
      //         curve: Curves.fastOutSlowIn,
      //         child: MenuDrawerButton(
      //           riveOnInit: (artboard) {
      //             StateMachineController controller =
      //                 RiveUtils.getRiveController(
      //               artboard,
      //               stateMachineName: "MENU_Interactivity",
      //             );
      //             isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
      //             isSideBarClosed.value = true;
      //           },
      //           press: () {
      //             isSideBarClosed.value = !isSideBarClosed.value;
      //             isSideMenuClosed ? open() : close();
      //             setState(() {
      //               isSideMenuClosed = isSideBarClosed.value;
      //             });
      //           },
      //         ),
      //       ),
      //     ],
      //   );
      // }),
      child: Scaffold(
        backgroundColor: const Color(0xff22211F),
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Drawer
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: const SideMenuDrawer(),
            ),

            // Screen
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                // offset: Offset(isSideMenuClosed ? 0 : 288, 0),
                child: Transform.scale(
                  // scale: isSideMenuClosed ? 1 : 0.7,
                  scale: scaleAnimation.value,
                  child: GestureDetector(
                    //onTap: _animationController.isCompleted ? close : null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          _animationController.isCompleted ? 24 : 0),
                      child: pages[0],
                    ),
                  ),
                ),
              ),
            ),

            // Menu Button
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 15,
              left: isSideMenuClosed ? 13 : 228,
              curve: Curves.fastOutSlowIn,
              child: MenuDrawerButton(
                svgIcon: isSideMenuClosed
                    ? 'assets/svg/nav.svg'
                    : 'assets/svg/close.svg',
                riveOnInit: (artboard) {
                  // StateMachineController controller =
                  //     RiveUtils.getRiveController(
                  //   artboard,
                  //   stateMachineName: "MENU_Interactivity",
                  // );
                  // isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                  // isSideBarClosed.value = true;
                },
                press: () {
                  // toggleDrawer();
                  // isSideBarClosed.value = !isSideBarClosed.value;
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
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      bottomNavs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          bottomNavs[index].input!.change(true);
                          if (bottomNavs[index] != selectedBottomNav) {
                            //selectedBottomNav.input!.change(false);
                            selectedBottomNav = bottomNavs[index];
                          }
                          Future.delayed(const Duration(seconds: 1), () {
                            bottomNavs[index].input!.change(false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SlidingIndicator(
                              isActive: bottomNavs[index] == selectedBottomNav,
                            ),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: Opacity(
                                opacity: selectedBottomNav == bottomNavs[index]
                                    ? 1
                                    : .5,
                                child: RiveAnimation.asset(
                                  bottomNavs.first.src,
                                  artboard: bottomNavs[index].artboard,
                                  onInit: (artboard) {
                                    StateMachineController controller =
                                        RiveUtils.getRiveController(
                                      artboard,
                                      stateMachineName:
                                          bottomNavs[index].stateMachineName,
                                    );

                                    bottomNavs[index].input =
                                        controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //),
    );
  }
}
