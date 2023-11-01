import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider.dart';

import 'package:flutter_application_2/widgets/splash_screen.dart';
import 'package:provider/provider.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

//import 'package:flutter_application_2/widgets/splash_screen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return ChangeNotifierProvider(
            create: (context) => providerExample(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.amber),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              home: SplashScreen(),
            ),
          );
        });
  }
}
