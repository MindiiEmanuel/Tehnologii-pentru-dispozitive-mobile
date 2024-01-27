// Acest fișier conține widget-ul `ActionsRow`, care reprezintă rândul de acțiuni din pagina principală.

import 'package:flutter/material.dart';
import '../../pages/add_emoji_page.dart';
import '../../pages/favorites_page.dart';
import '../../data/emoji_constants.dart';
import '../../data/favorite_item.dart';

class ActionsRow extends StatefulWidget {
  // Proprietăți necesare pentru construirea widget-ului
  final String formattedDate;
  final List<FavoriteItem> favoriteItems;
  final Function(String, String) onSaveEmoji;
  final double iconSize;

  // Constructor pentru a inițializa proprietățile
  ActionsRow({
    required this.formattedDate,
    required this.favoriteItems,
    required this.onSaveEmoji,
    required this.iconSize,
  });

  @override
  _ActionsRowState createState() => _ActionsRowState();
}

class _ActionsRowState extends State<ActionsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Buton pentru adăugarea unui emoji
        InkWell(
          onTap: () async {
            await _navigateToPage(
              context,
              AddEmojiPage(
                selectedEmoji: "😀",
                onSaveEmoji: (emoji) {
                  widget.onSaveEmoji(emoji, widget.formattedDate);
                },
              ),
            );
          },
          child: Text(
            EmojiConstants.add,
            style: TextStyle(fontSize: widget.iconSize, color: Colors.white),
          ),
        ),
        SizedBox(width: 16), // Spațiere între butoane
        // Buton pentru afișarea paginii de Favorite
        InkWell(
          onTap: () async {
            await _navigateToPage(
              context,
              FavoritesPage(favoriteItems: widget.favoriteItems),
            );
          },
          child: Text(
            EmojiConstants.favorite,
            style: TextStyle(fontSize: widget.iconSize, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // Funcție pentru a naviga la o pagină nouă
  Future<void> _navigateToPage(BuildContext context, Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
