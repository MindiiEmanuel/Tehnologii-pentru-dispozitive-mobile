import 'package:emojournal/widgets/widgets_list_page/favorites_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Utilizează ChangeNotifierProvider pentru a furniza o instanță a FavoritesNotifier la nivel global în aplicație
    ChangeNotifierProvider(
      create: (context) => FavoritesNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Corpul principal al aplicației
        );
  }
}
