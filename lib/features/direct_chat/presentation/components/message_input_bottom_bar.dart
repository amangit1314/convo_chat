import 'package:convo_chat/features/direct_chat/data/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/theme/colors.dart';

class MessageInputBottomBar extends ConsumerStatefulWidget {
  const MessageInputBottomBar({
    Key? key,
    required this.receiverId,
  }) : super(key: key);

  final String receiverId;

  @override
  ConsumerState<MessageInputBottomBar> createState() =>
      _MessageInputBottomBarState();
}

class _MessageInputBottomBarState extends ConsumerState<MessageInputBottomBar>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      ref
          .read<ChatController>(chatControllerProvider)
          .sendMessage(widget.receiverId, _messageController.text);
      _messageController.clear();
    }
  }

  void _handleSendButtonTap() {
    sendMessage();
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions),
              ),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: TextFormField(
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: primaryColor),
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message ...',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: primaryColor.withOpacity(.7)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.link),
              ),
            ),
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mic),
              ),
            ),
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  _handleSendButtonTap();
                },
                icon: const Icon(Icons.send_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
