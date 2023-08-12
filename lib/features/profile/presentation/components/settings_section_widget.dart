import 'package:convo_chat/core/utils/config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/colors.dart';

class SettingsSectionWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final Function() onValueChanged;

  const SettingsSectionWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.value,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getProportionateScreenHeight(16),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: primaryColor.withOpacity(.5),
            trackColor: Colors.black,
            thumbColor: primaryColor,
            value: value,
            onChanged: (_) => onValueChanged(),
          ),
        ],
      ),
    );
  }
}
