// Acest fișier conține widget-ul `FavoriteListItem`, care este utilizat pentru a afișa un element favorit în lista de favorite.

import 'package:emojournal/data/emoji_data.dart';
import 'package:flutter/material.dart';
import '../../data/favorite_item.dart';

class FavoriteListItem extends StatelessWidget {
  // Instanța `EmojiData` este necesară pentru a accesa date despre emoji în cadrul acestui widget.
  final EmojiData emojiData;

  // Elementul favorit pe care îl va afișa acest widget.
  final FavoriteItem favoriteItem;

  // Funcție de ștergere apelată atunci când utilizatorul dorește să șteargă elementul favorit.
  final VoidCallback onDelete;

  // Constructor pentru a inițializa instanțele necesare.
  FavoriteListItem({
    required this.emojiData,
    required this.favoriteItem,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Stilul și spațierea pentru fiecare element de listă.
      tileColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),

      // Partea stângă a elementului de listă, care afișează emoji-ul favorit.
      leading: Container(
        width: 50,
        height: 50,
        color: Colors.white,
        child: Center(
          child: Text(
            favoriteItem.emoji,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),

      // Partea centrală a elementului de listă, care afișează data emoji-ului favorit.
      title: Center(
        child: Text(
          favoriteItem.date,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      // Partea dreaptă a elementului de listă, care conține butonul de ștergere.
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.blue),
        onPressed: onDelete,
      ),
    );
  }
}
