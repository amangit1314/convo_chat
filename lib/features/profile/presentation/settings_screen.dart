import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/utils/config/size_config.dart';
import 'components/settings_section_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationPermissionEnabled = false;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _checkNotificationPermissionStatus();
  }

  void _checkNotificationPermissionStatus() async {
    final status = await Permission.notification.status;
    setState(() {
      _notificationPermissionEnabled = status.isGranted;
    });
  }

  void _toggleNotificationPermission() async {
    if (!_notificationPermissionEnabled) {
      final status = await Permission.notification.request();
      setState(() {
        _notificationPermissionEnabled = status.isGranted;
      });
    } else {
      openAppSettings();
    }
  }

  void toggleTheme() async {
    context.read<ThemeCubit>().toggleTheme();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Widget buildIOSSwitch() => Transform.scale(
        scale: 1.1,
        child: CupertinoSwitch(
          activeColor: primaryColor.withOpacity(.5),
          trackColor: Colors.black,
          thumbColor: primaryColor,
          value: _notificationPermissionEnabled,
          onChanged: (_) => _toggleNotificationPermission(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SettingsSectionWidget(
              title: 'Notifications',
              description: 'Turn on & off notifications',
              value: _notificationPermissionEnabled,
              onValueChanged: _toggleNotificationPermission,
            ),
            SettingsSectionWidget(
              title: 'Read receipts',
              description: 'Turn off message is seen feature',
              value: _notificationPermissionEnabled,
              onValueChanged: _toggleNotificationPermission,
            ),
            SettingsSectionWidget(
              title: 'Media Access',
              description: 'If not given wont able to access media from device',
              value: _notificationPermissionEnabled,
              onValueChanged: _toggleNotificationPermission,
            ),
            SettingsSectionWidget(
              title: 'Location',
              description: 'Permission to access live location of device',
              value: _notificationPermissionEnabled,
              onValueChanged: _toggleNotificationPermission,
            ),
            SettingsSectionWidget(
              title: 'Camera',
              description: 'Permission to access camera of device',
              value: _notificationPermissionEnabled,
              onValueChanged: _toggleNotificationPermission,
            ),
            SettingsSectionWidget(
              title: 'Theme',
              description: 'Turn on or off dark mode',
              value: _isDarkMode,
              onValueChanged: toggleTheme,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Themes',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      'Choose custom themes for app',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  // divider with padding all 10

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildThemeOption(Colors.red),
                        _buildThemeOption(Colors.blue),
                        _buildThemeOption(Colors.green),
                        _buildThemeOption(Colors.purple),
                        _buildThemeOption(Colors.orange),
                        _buildThemeOption(Colors.pink),
                        _buildThemeOption(Colors.teal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(Color color) {
    return Container(
      height: getProportionateScreenHeight(100),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(right: 10, top: 10),
    );
  }
}
