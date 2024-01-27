// Acest fișier conține widget-ul `BottomNavigation`, care reprezintă bara de navigație din partea de jos a paginii principale.

import 'package:flutter/material.dart';
import '../../pages/emoticon_page.dart';
import '../../pages/list_page.dart';
import '../../data/emoji_constants.dart';

class BottomNavigation extends StatelessWidget {
  // Dimensiunea iconurilor și culoarea fundalului pentru bara de navigație
  final double iconSize = 24.0;
  final Color bottomNavColor = Color(0xFF3498DB);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // Rândul de butoane din bara de navigație
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Butoanele pentru paginile de emoticoane și listă
          InkWell(
            onTap: () {
              // Navighează la pagina EmoticonOfTheDayPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmoticonOfTheDayPage()),
              );
            },
            child: Text(
              EmojiConstants.emoji,
              style: TextStyle(fontSize: iconSize, color: bottomNavColor),
            ),
          ),
          InkWell(
            onTap: () {
              // Navighează la pagina ListPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListPage()),
              );
            },
            child: Text(
              EmojiConstants.list,
              style: TextStyle(fontSize: iconSize, color: bottomNavColor),
            ),
          ),
        ],
      ),
    );
  }
}
