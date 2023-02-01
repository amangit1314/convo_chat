import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, src, stateMachineName, title;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'CHAT',
    stateMachineName: 'CHAT_Interactivity',
    title: 'Chat',
    //input: SMIBool(false),
  ),
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
    title: 'Notifications',
    //input: SMIBool(false),
  ),
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
    title: 'Profile',
    //input: SMIBool(false),
  ),
];

List<RiveAsset> sideMenus = [
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'CHAT',
    stateMachineName: 'CHAT_Interactivity',
    title: 'Chat',
    //input: SMIBool(false),
  ),
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_Interactivity',
    title: 'Search',
    //input: SMIBool(false),
  ),
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
    title: 'Profile',
    //input: SMIBool(false),
  ),
];

List<RiveAsset> sideMenus2 = [
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'TIMER',
    stateMachineName: 'TIMER_Interactivity',
    title: 'History',
    //input: SMIBool(false),
  ),
  RiveAsset(
    'assets/riveAssets/icons.riv',
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
    title: 'Notifications',
    //input: SMIBool(false),
  ),
];
