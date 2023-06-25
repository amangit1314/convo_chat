import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../auth/presentation/components/auth_button.dart';

class CreateGroupScreen extends StatefulWidget {
  static const routeName = '/createGroup';
  final String imageAssetUrl;

  const CreateGroupScreen({Key? key, required this.imageAssetUrl})
      : super(key: key);

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   titleSpacing: 0,
      //   // title: Column(
      //   //   crossAxisAlignment: CrossAxisAlignment.start,
      //   //   children: [
      //   //     const Text(
      //   //       'Create New Group',
      //   //       style: TextStyle(
      //   //         color: primaryColor,
      //   //         fontSize: 16,
      //   //         fontWeight: FontWeight.w600,
      //   //       ),
      //   //     ),
      //   //     Text(
      //   //       'Group Name',
      //   //       style: TextStyle(color: textColor, fontSize: 12),
      //   //     ),
      //   //   ],
      //   // ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: ,
      //   actions: [
      //     // font awesome icons grid

      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel_outlined,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create group',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Create group with group details',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 15),
              // const Center(
              //   child: CircleAvatar(
              //     radius: 35,
              //     backgroundImage: AssetImage('assets/images/1.jpg'),
              //   ),
              // ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Group Name',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: primaryColor),
                      controller: _groupNameController,
                      decoration: InputDecoration(
                        hintText: 'Group name',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: primaryColor.withOpacity(.7)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Group Description',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      // all 2
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        // border 1 width
                        border: Border.all(
                          color: primaryColor.withOpacity(.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        maxLength: 100,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: primaryColor),
                        controller: _groupNameController,
                        decoration: InputDecoration(
                          hintText: 'Group description',
                          // no border
                          border: InputBorder.none,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: primaryColor.withOpacity(.7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Participants:',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // width 10 sizedbox
                        SizedBox(width: 10),
                        CircleAvatar(
                          // padding 8
                          backgroundColor: popColor,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const ParticipantWidget(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: AuthButton(
                  textColor: Colors.white,
                  bgColor: popColor,
                  height: 70,
                  name: 'Create and Continue',
                  borderColor: popColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParticipantWidget extends StatelessWidget {
  const ParticipantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/5.jpg'),
        ),
        const SizedBox(height: 2),
        Text(
          'Username',
          style: TextStyle(color: textColor, fontSize: 12),
        ),
      ],
    );
  }
}
