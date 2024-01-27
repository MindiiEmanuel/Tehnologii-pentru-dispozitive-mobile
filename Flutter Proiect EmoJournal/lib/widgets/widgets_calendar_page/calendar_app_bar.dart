import 'package:flutter/material.dart';

// Clasa CalendarAppBar reprezintă bara de sus a paginii Calendar.
class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // Obține dimensiunea preferată a barei de sus pentru a fi utilizată în Scaffold.
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  // Construiește widget-ul pentru bara de sus a paginii Calendar.
  Widget build(BuildContext context) {
    return AppBar(
      // Textul afișat în bara de sus
      title: Text(
        'Calendar',
        style: TextStyle(color: Colors.white),
      ),
      // Culorea de fundal a barei de sus
      backgroundColor: Colors.blue,
    );
  }
}
