import 'package:flutter/material.dart';

import 'selectors.dart';

void main() {
  runApp(const WaifuApp());
}

class WaifuApp extends StatelessWidget {
  const WaifuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waifu2xFlutter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const WaifuHome(title: 'Upscale an image'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
