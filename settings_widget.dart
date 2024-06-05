// screens/settings_widget.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pos_system/models/settings.dart';

class SettingsWidget extends StatefulWidget {
  final VoidCallback onSettingsChanged;

  const SettingsWidget({required this.onSettingsChanged, super.key});

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final _tableController = TextEditingController();
  final _nameController = TextEditingController();

  late Box<Settings> settingsBox;

  @override
  void initState() {
    super.initState();
    settingsBox = Hive.box<Settings>('settingsBox');
    _loadSettings();
  }

  void _loadSettings() {
    final settings = settingsBox.get('settings') ??
        Settings(numberOfTables: 0, restaurantName: '');
    _tableController.text = settings.numberOfTables.toString();
    _nameController.text = settings.restaurantName;
  }

  void _saveSettings() {
    final settings = Settings(
      numberOfTables: int.parse(_tableController.text),
      restaurantName: _nameController.text,
    );
    settingsBox.put('settings', settings);
    widget.onSettingsChanged();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Settings saved successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Restaurant Name'),
          ),
          TextField(
            controller: _tableController,
            decoration: const InputDecoration(labelText: 'Number of Tables'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveSettings,
            child: const Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}
