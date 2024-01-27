import 'package:emojournal/widgets/widgets_settings_page/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  // Culoarea pentru bara de sus
  final Color topBarColor = Color(0xFF3498DB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: AppBar(
        backgroundColor: topBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Settings",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      // Corpul paginii cu opțiunile de mod temă
      body: Column(
        children: [
          // Opțiune pentru modul de temă Light
          LightModeOption(
            // Folosește Provider pentru a obține instanța ThemeProvider din context
            themeProvider: Provider.of<ThemeProvider>(context),
          ),
          // Opțiune pentru modul de temă Dark
          DarkModeOption(
            themeProvider: Provider.of<ThemeProvider>(context),
          ),
          // Opțiune pentru modul de temă Purple
          PurpleModeOption(
            themeProvider: Provider.of<ThemeProvider>(context),
          ),
        ],
      ),
    );
  }
}
