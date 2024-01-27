// Acest fișier conține definirea clasei FavoriteItem.

// Clasa FavoriteItem reprezintă un element favorit și include un emoji și data asociată cu acel emoji.
class FavoriteItem {
  final String emoji; // Emoji-ul asociat elementului favorit.
  final String date; // Data asociată cu emoji-ul favorit.

  // Constructor pentru clasa FavoriteItem.
  FavoriteItem({
    required this.emoji, // Emoji-ul trebuie furnizat la crearea unui obiect FavoriteItem.
    required this.date, // Data trebuie furnizată la crearea unui obiect FavoriteItem.
  });
}
