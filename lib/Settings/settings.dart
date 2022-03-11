import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key, required this.preferences}) : super(key: key);

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("General"),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text("Language"),
                value: Text(preferences.getStringList("lang")![1]),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.format_paint),
                title: const Text("Theme"),
                value: Text(preferences.getString("theme")!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
