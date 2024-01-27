import 'package:flutter/material.dart';
import 'package:emojournal/data/emoji_constants.dart';
import '../../pages/calendar_page.dart';
import '../../pages/settings_page.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  // Dimensiunea și culoarea pentru pictogramele din bara de sus
  final double iconSize = 24.0;
  final Color topBarColor = Color(0xFF3498DB);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: topBarColor,
      title: Row(
        children: [
          // Pictograma pentru a naviga la pagina de calendar
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
            child: Text(
              EmojiConstants.calendar,
              style: TextStyle(fontSize: iconSize, color: Colors.white),
            ),
          ),
          SizedBox(width: 8),
          // Titlul aplicației
          Expanded(
            child: Center(
              child: Text(
                "EmoJournal",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          // Pictograma pentru a naviga la pagina de setări
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: Text(
              EmojiConstants.settings,
              style: TextStyle(fontSize: iconSize, color: Colors.white),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
