import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.red, // Schimbare culoare fundal bara de navigare
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Textul "Settings" alb
        ),
        iconTheme: IconThemeData(color: Colors.white), // Iconița de back albă
      ),
      // Eliminare body cu textul "Settings Page"
    );
  }
}
