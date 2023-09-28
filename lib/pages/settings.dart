import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noel_notes/component/themes.dart';

import '../component/icons/unicon_icons.dart';

Brightness? _brightness = Brightness.light;
Accents? _colors = Accents.peachPink;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            MenuItemButton(
              leadingIcon: const Icon(Unicon.brightness_half),
              child: const Text('Theme'),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text("Change theme mode?"),
                  children: [
                    RadioListTile(
                      title: const Text("Light"),
                      value: Brightness.light,
                      groupValue: _brightness,
                      onChanged: (value) {
                        _brightness = value;
                        context.read<ThemeCubit>().toggleTheme();
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile(
                      title: const Text("Dark"),
                      value: Brightness.dark,
                      groupValue: _brightness,
                      onChanged: (value) {
                        _brightness = value;
                        context.read<ThemeCubit>().toggleTheme();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            MenuItemButton(
              leadingIcon: const Icon(Unicon.palette),
              child: const Text('Accents'),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text("Change theme color?"),
                  children: List<RadioListTile>.generate(
                    Accents.values.length,
                    (index) => RadioListTile(
                      value: Accents.values,
                      groupValue: _colors,
                      onChanged: (value) {
                        _colors = value;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
