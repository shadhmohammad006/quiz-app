import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';

import 'package:flutter_application_2/widgets/splash_screen.dart';
import 'package:provider/provider.dart';

import 'provider/general_provider.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

//import 'package:flutter_application_2/widgets/splash_screen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    print('app rebuilding');
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => GeneralProvider()),
            ],
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
