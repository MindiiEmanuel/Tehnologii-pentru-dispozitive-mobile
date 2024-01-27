// Importăm bibliotecile necesare pentru funcționalitatea paginii
import 'package:emojournal/data/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/emoji_data.dart';
import '../widgets/widgets_home_page/top_bar.dart'; // Importăm top_bar.dart
import '../widgets/widgets_home_page/selected_emoji_display.dart';
import '../widgets/widgets_home_page/actions_row.dart';
import '../widgets/widgets_home_page/bottom_navigation.dart';

// Lista lunilor
final List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

// Pagina principală a aplicației
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista de elemente favorite
  List<FavoriteItem> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    // Folosește provider pentru a obține instanța EmojiData
    EmojiData emojiData = Provider.of<EmojiData>(context);

    // Obținem data curentă
    DateTime currentDate = DateTime.now();
    // Formatăm data pentru a afișa luna și ziua
    String formattedDate =
        "${months[currentDate.month - 1]} ${currentDate.day}";

    return Scaffold(
      appBar: TopBar() as PreferredSizeWidget?,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text pentru afișarea zilei curente
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text pentru afișarea datei curente
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Afișare emoji selectat
          SelectedEmojiDisplay(emojiData: emojiData),
          // Rând de acțiuni (butonul de salvare și lista de favorite)
          ActionsRow(
            formattedDate: formattedDate,
            favoriteItems: favoriteItems,
            onSaveEmoji: (emoji, date) {
              emojiData.setEmoji(emoji, date);
              setState(() {
                var existingItem = favoriteItems.firstWhere(
                  (item) =>
                      item.emoji == emojiData.selectedEmoji &&
                      item.date == date,
                  orElse: () => FavoriteItem(emoji: "", date: ""),
                );

                if (existingItem.emoji.isEmpty) {
                  favoriteItems.add(
                    FavoriteItem(
                      emoji: emojiData.selectedEmoji,
                      date: date,
                    ),
                  );
                }
              });
            },
            iconSize: 24.0,
          )
        ],
      ),
      // Bara de navigare în partea de jos a paginii
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
