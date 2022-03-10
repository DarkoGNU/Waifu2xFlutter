import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waifu2x_flutter/themes.dart' as theming;

import 'Pickers/tab_selector.dart';
import 'Settings/settings.dart';
import 'init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final preferences = await SharedPreferences.getInstance();

  return runApp(
    WaifuApp(
      savedThemeMode: savedThemeMode,
      preferences: preferences,
    ),
  );
}

class WaifuApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final SharedPreferences preferences;

  WaifuApp(
      {Key? key, required this.savedThemeMode, required this.preferences})
      : super(key: key);

  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: theming.lightTheme,
      dark: theming.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'Waifu2xFlutter',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: FutureBuilder(
          future: _initFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const InitScreen();
            } else {
              return WaifuHome(preferences: preferences);
            }
          }
        ),
      ),
    );
  }
}

class WaifuHome extends StatelessWidget {
  final SharedPreferences preferences;

  const WaifuHome({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upscale an image"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsPage(preferences: preferences))),
            ),
          ),
        ],
      ),
      body: const TabSelector(),
    );
  }
}
