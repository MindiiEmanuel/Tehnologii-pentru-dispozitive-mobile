import 'package:flutter/material.dart';

// Clasa EmoticonOfTheDayDisplay reprezintă un widget pentru afișarea "Emoji of the Day".
class EmoticonOfTheDayDisplay extends StatelessWidget {
  final Animation<double> animation;
  final String emojiOfTheDay;

  // Constructorul pentru a inițializa instanța cu animația și emoji-ul zilei.
  const EmoticonOfTheDayDisplay({
    Key? key,
    required this.animation,
    required this.emojiOfTheDay,
  }) : super(key: key);

  @override
  // Construiește și afișează widget-ul cu emoji-ul zilei, folosind animația pentru a schimba dimensiunea textului.
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Text(
          emojiOfTheDay, // Emoji-ul afișat
          style: TextStyle(
              fontSize: animation
                  .value), // Dimensiunea textului se schimbă în timpul animației
        );
      },
    );
  }
}
