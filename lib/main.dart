import 'package:flutter/material.dart';
import 'package:waifu2x_flutter/themes.dart';

import 'Pickers/tab_selector.dart';

void main() {
  runApp(const WaifuApp());
}

class WaifuApp extends StatelessWidget {
  const WaifuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waifu2xFlutter',
      home: const WaifuHome(title: 'Upscale an image'),
      theme: lightTheme(context),
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
