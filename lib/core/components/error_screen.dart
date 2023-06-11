import 'package:convo_chat/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return showErrorSnackBar(context, error);
  }
}
