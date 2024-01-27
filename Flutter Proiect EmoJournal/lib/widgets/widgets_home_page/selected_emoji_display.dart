// Acest fișier conține widget-ul `SelectedEmojiDisplay`, care afișează emoji-ul selectat în partea de sus a paginii principale.

import 'package:flutter/material.dart';
import '../../data/emoji_data.dart';

class SelectedEmojiDisplay extends StatelessWidget {
  // Instanța `EmojiData` este necesară pentru a accesa emoji-ul selectat.
  final EmojiData emojiData;

  // Dimensiunea și culoarea pentru afișarea emoji-ului selectat
  final double iconSize = 24.0;
  final Color topBarColor = Color(0xFF3498DB);

  // Constructor pentru a inițializa instanța `EmojiData`
  SelectedEmojiDisplay({required this.emojiData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: topBarColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              // Verifică dacă emoji-ul selectat nu este gol și îl afișează; altfel, afișează un șir gol.
              emojiData.selectedEmoji.isNotEmpty ? emojiData.selectedEmoji : "",
              style: TextStyle(
                fontSize: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
