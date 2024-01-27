// Acest fișier definește un dialog pentru selectarea emoji-urilor.

import 'package:flutter/material.dart';

class EmojiPickerDialog extends StatelessWidget {
  // Lista de emoji-uri disponibile pentru selecție
  final List<Map<String, String>> emojis;

  // Funcția care este apelată atunci când un emoji este selectat
  final Function(String) onEmojiSelected;

  // Constructor pentru EmojiPickerDialog
  EmojiPickerDialog({required this.emojis, required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Titlul dialogului
      title: Text(
        'Select Emoji',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      // Conținutul dialogului
      content: Container(
        width: double.maxFinite,
        child: GridView.builder(
          // Configurarea gridului pentru afișarea emoji-urilor
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          // Numărul total de emoji-uri
          itemCount: emojis.length,
          // Constructor pentru fiecare element din grid
          itemBuilder: (context, index) {
            // Obține emoji-ul la indexul curent
            final emoji = emojis[index]['emoji']!;
            return GestureDetector(
              onTap: () {
                // La apăsarea unui emoji, apelează funcția de selectare și închide dialogul
                onEmojiSelected(emoji);
                Navigator.of(context).pop();
              },
              child: Container(
                // Stilizare pentru fiecare container care conține emoji
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    emoji,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
