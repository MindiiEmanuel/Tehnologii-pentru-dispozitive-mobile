import 'package:emojournal/widgets/widgets_list_page/favorites_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmojiItem extends StatefulWidget {
  final String emoji;
  final String name;

  EmojiItem({required this.emoji, required this.name});

  @override
  _EmojiItemState createState() => _EmojiItemState();
}

class _EmojiItemState extends State<EmojiItem> {
  // Culoarea pentru bara de sus a paginii
  final Color topBarColor = Color(0xFF3498DB);

  // Culoarea inimii pentru starea de favorite
  final Color heartColor = Colors.red; // Schimbare la culoarea roșie

  // Culoarea marginii inimii pentru starea de favorite
  final Color heartBorderColor = Colors.blue; // Schimbare la culoarea roșie

  @override
  Widget build(BuildContext context) {
    // Obține instanța FavoritesNotifier din context
    var favoritesNotifier = Provider.of<FavoritesNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Widget pentru afișarea emoji-ului și a numelui
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.emoji,
                style: TextStyle(
                  fontSize: 16,
                  color: topBarColor,
                ),
              ),
            ),
            SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 12,
                  color: topBarColor,
                ),
              ),
            ),
          ],
        ),
        // Widget pentru adăugarea/eliminarea emoji-ului din favorite
        InkWell(
          onTap: () {
            // Folosește FavoritesNotifier pentru a adăuga/elimina emoji-ul din favorite
            favoritesNotifier.toggleFavorite(widget.emoji);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: heartBorderColor,
                width: 1.5,
              ),
            ),
            child: Text(
              "❤️",
              style: TextStyle(
                fontSize: 16,
                color: favoritesNotifier.isFavorite(widget.emoji)
                    ? heartColor.withOpacity(0.7)
                    : Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
