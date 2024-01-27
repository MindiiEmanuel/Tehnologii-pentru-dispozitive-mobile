import 'package:emojournal/widgets/widgets_list_page/favorites_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/emoji_data.dart';
import 'data/theme_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmojiData()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                FavoritesNotifier()), // Adaugă FavoritesNotifier
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obține instanța ThemeProvider din context
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    // Inițializează un obiect ThemeData pe baza modului temei selectat
    ThemeData selectedTheme;
    switch (themeProvider.themeModeType) {
      case ThemeModeType.Dark:
        selectedTheme = ThemeData.dark();
        break;
      case ThemeModeType.Purple:
        selectedTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.purpleAccent),
        );
        break;
      case ThemeModeType.Light:
        selectedTheme = ThemeData.light();
        break;
    }

    return MaterialApp(
      home: HomePage(),
      theme: selectedTheme,
      // Setează modul temei pe baza modului temei selectat
      themeMode: themeProvider.themeModeType == ThemeModeType.Dark
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
