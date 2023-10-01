import 'package:convo_chat/core/utils/theme/cubit/theme_cubit.dart';
import 'package:convo_chat/core/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'features/splash/splash_screen.dart';

class ConvoApp extends ConsumerWidget {
  const ConvoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
          child: const ThemedMaterialApp(home: SplashScreen()),
        )
      ],
      child: const ThemedMaterialApp(home: SplashScreen()),
    );
  }
}

class ThemedMaterialApp extends StatelessWidget {
  final Widget home;
  const ThemedMaterialApp({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return GetMaterialApp(
          title: 'Convo',
          theme: state == ThemeData.dark() ? ConvoAppColorTheme.darkTheme : ConvoAppColorTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: home,
        );
      },
    );
  }
}
