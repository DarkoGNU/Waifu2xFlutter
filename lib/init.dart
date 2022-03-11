import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Launching...",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}

class Init {
  static Future initialize() async {
    await _initSettings();
  }

  static Future<void> _initSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final List<String>? lang = preferences.getStringList("lang");
    if (lang == null) {
      preferences.setStringList("lang", ["system", "System"]);
    }

    final String? theme = preferences.getString("theme");
    if (theme == null) {
      preferences.setString("theme", "system");
    }
  }
}
