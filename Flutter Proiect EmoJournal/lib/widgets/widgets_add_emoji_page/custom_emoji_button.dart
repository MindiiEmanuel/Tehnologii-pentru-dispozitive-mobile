import 'package:flutter/material.dart';

class CustomEmojiButton extends StatelessWidget {
  final String emoji;
  final double iconSize;
  final VoidCallback onPressed;

  const CustomEmojiButton({
    Key? key,
    required this.emoji,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: iconSize * 1.5,
        height: iconSize * 1.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 252, 252, 252),
        ),
        child: Center(
          child: Text(
            emoji,
            style: TextStyle(
              fontSize: iconSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
