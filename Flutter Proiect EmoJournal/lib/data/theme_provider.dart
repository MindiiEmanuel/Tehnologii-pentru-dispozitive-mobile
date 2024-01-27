// Acest fișier conține definirea clasei ThemeProvider.

import 'package:flutter/material.dart';

// Enumerarea ThemeModeType definește tipurile posibile de mod temă.
enum ThemeModeType {
  Light,
  Dark,
  Purple,
}

// Clasa ThemeProvider gestionează modul temei pentru aplicație.
class ThemeProvider with ChangeNotifier {
  // Variabila privată care reține modul curent al temei.
  ThemeModeType _themeModeType = ThemeModeType.Light;

  // Getter pentru a obține modul curent al temei.
  ThemeModeType get themeModeType => _themeModeType;

  // Metoda toggleTheme schimbă modul temei și notifică ascultătorii (listeners).
  void toggleTheme(ThemeModeType themeMode) {
    _themeModeType = themeMode; // Setează modul temei la valoarea furnizată.
    notifyListeners(); // Anunță ascultătorii că s-a schimbat modul temei.
  }
}
