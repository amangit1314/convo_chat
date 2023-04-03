import 'package:convo_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'convo_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'convo',
  );

  /// Create a new instance of [StreamChatClient] passing the apikey obtained
  /// from your project dashboard.
  // final client = StreamChatClient(StreamChatConfig().apiKey);
  // /// Set the current user. In a production scenario, this should be done using
  // /// a backend to generate a user token using our server SDK.
  // /// Please see the following for more information:
  // /// https://getstream.io/chat/docs/ios_user_setup_and_tokens/
  // await client.connectUser(
  //   User(
  //     id: 'cool-shadow-7',
  //     image:
  //         'https://getstream.io/random_png/?id=cool-shadow-7&amp;name=Cool+shadow',
  //   ),
  //   '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiY29vbC1zaGFkb3ctNyJ9.gkOlCRb1qgy4joHPaxFwPOdXcGvSPvp6QY0S4mpRkVo''',
  // );

  runApp(const ProviderScope(child: ConvoApp()));
  // runApp(const ConvoApp());
}
