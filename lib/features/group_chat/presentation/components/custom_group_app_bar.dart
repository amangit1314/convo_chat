import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../nav/presentation/bottom_nav.dart';
import '../group_information_screen.dart';

class CustomGroupAppBar extends StatelessWidget {
  final String imageAssetUrl;
  final String groupName;

  const CustomGroupAppBar({
    super.key,
    required this.imageAssetUrl,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flexible(
        child: Material(
          elevation: 0,
          color: primaryLightColor,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 6),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: popColor,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imageAssetUrl),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => GroupInfo(
                        adminName: 'Pale',
                        groupName: groupName,
                        groupId: '',
                        // imageAssetUrl: imageAssetUrl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupName,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color:
                                Colors.indigoAccent.shade400.withOpacity(.8)),
                      ),
                      Text(
                        'tap here for group info',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: textColor,
                              fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.mobile,
                  size: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.optinMonster,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
