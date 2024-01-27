import 'package:flutter/material.dart';

// Clasa EmoticonOfTheDayDescription reprezintă un widget pentru afișarea descrierii "Emoji of the Day".
class EmoticonOfTheDayDescription extends StatelessWidget {
  final Color topBarColor;

  // Constructorul pentru a inițializa instanța cu culoarea barei de sus.
  const EmoticonOfTheDayDescription({
    Key? key,
    required this.topBarColor,
  }) : super(key: key);

  @override
  // Construiește și afișează widget-ul cu descrierea "Emoji of the Day".
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " Emoji of the day ",
          style: TextStyle(
            fontSize: 30,
            color: topBarColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
