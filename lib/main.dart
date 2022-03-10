import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:waifu2x_flutter/themes.dart' as theming;

import 'Pickers/tab_selector.dart';
import 'Settings/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  return runApp(WaifuApp(savedThemeMode: savedThemeMode));
}

class WaifuApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const WaifuApp({Key? key, this.savedThemeMode}) : super(key: key);

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
        home: const WaifuHome(title: 'Upscale an image'),
      ),
    );
  }
}

class WaifuHome extends StatelessWidget {
  final String title;
  const WaifuHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage())),
            ),
          ),
        ],
      ),
      body: const TabSelector(),
    );
  }
}
