// Clasa EmojiData gestionează datele legate de emoji-uri în aplicație.

import 'package:flutter/material.dart';

class EmojiData with ChangeNotifier {
  // Emoji-ul selectat curent
  String selectedEmoji = "";

  // Emoji-ul selectat pentru marcarea ca favorit
  String selectedHeartEmoji = "";

  // Data formatată asociată cu emoji-ul selectat
  String formattedDate = "";

  // Metoda setEmoji actualizează datele cu emoji-ul și data specificate și notifică ascultătorii.
  void setEmoji(String emoji, String date) {
    selectedEmoji = emoji;
    selectedHeartEmoji = emoji.isNotEmpty ? emoji : "";
    formattedDate = date;

    // Notifică ascultătorii (widget-urile care depind de aceste date) despre schimbare.
    notifyListeners();
  }
}
