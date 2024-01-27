import 'package:flutter/material.dart';
import '../../data/theme_provider.dart';

// Widget pentru opțiunea de mod Luminos
class LightModeOption extends StatelessWidget {
  final ThemeProvider themeProvider;

  LightModeOption({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Light Mode"),
      trailing: Switch(
        value: themeProvider.themeModeType == ThemeModeType.Light,
        onChanged: (value) {
          // Folosește ThemeProvider pentru a schimba modul temei la Luminos
          themeProvider.toggleTheme(ThemeModeType.Light);
        },
      ),
    );
  }
}

// Widget pentru opțiunea de mod Întunecat
class DarkModeOption extends StatelessWidget {
  final ThemeProvider themeProvider;

  DarkModeOption({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Dark Mode"),
      trailing: Switch(
        value: themeProvider.themeModeType == ThemeModeType.Dark,
        onChanged: (value) {
          // Folosește ThemeProvider pentru a schimba modul temei la Întunecat
          themeProvider.toggleTheme(ThemeModeType.Dark);
        },
      ),
    );
  }
}

// Widget pentru opțiunea de mod Mov
class PurpleModeOption extends StatelessWidget {
  final ThemeProvider themeProvider;

  PurpleModeOption({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Purple Mode"),
      trailing: Switch(
        value: themeProvider.themeModeType == ThemeModeType.Purple,
        onChanged: (value) {
          // Folosește ThemeProvider pentru a schimba modul temei la Mov
          themeProvider.toggleTheme(ThemeModeType.Purple);
        },
      ),
    );
  }
}
