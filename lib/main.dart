import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:waifu2x_flutter/themes.dart';

import 'Pickers/tab_selector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  return runApp(WaifuApp(savedThemeMode: savedThemeMode!));
}

class WaifuApp extends StatelessWidget {
  const WaifuApp({Key? key, required this.savedThemeMode}) : super(key: key);

  final AdaptiveThemeMode savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme(context),
      dark: lightTheme(context), // TODO: implement dark theme
      initial: savedThemeMode,
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'Waifu2xFlutter',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const WaifuHome(title: 'Upscale an image'),
      ),
    );
  }
}

class WaifuHome extends StatefulWidget {
  const WaifuHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WaifuHome> createState() => _WaifuHomeState();
}

class _WaifuHomeState extends State<WaifuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const TabSelector(),
    );
  }
}
