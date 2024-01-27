import 'package:flutter/foundation.dart';

// Acestă clasă extinde ChangeNotifier pentru a oferi o modalitate de notificare a ascultătorilor despre modificările stării
class FavoritesNotifier extends ChangeNotifier {
  // Lista de emoji-uri favorite
  List<String> favoriteEmojis = [];

  // Funcție pentru a adăuga/elimina un emoji din lista de favorite
  void toggleFavorite(String emoji) {
    if (favoriteEmojis.contains(emoji)) {
      // Dacă emoji-ul este deja în lista de favorite, îl eliminăm
      favoriteEmojis.remove(emoji);
    } else {
      // Dacă emoji-ul nu este în lista de favorite, îl adăugăm
      favoriteEmojis.add(emoji);
    }

    // Notifică ascultătorii despre modificarea stării
    notifyListeners();
  }

  // Funcție pentru a verifica dacă un emoji este în lista de favorite
  bool isFavorite(String emoji) {
    return favoriteEmojis.contains(emoji);
  }
}
