// Importăm bibliotecile necesare pentru funcționalitatea paginii
import 'package:emojournal/data/favorite_item.dart';
import 'package:emojournal/widgets/widgets_favorites_page/favorites_page_body.dart';
import 'package:flutter/material.dart';

// Clasa pentru pagina de favorite
class FavoritesPage extends StatelessWidget {
  final Color topBarColor = Color(0xFF3498DB);
  final List<FavoriteItem> favoriteItems;

  // Constructorul care primește o listă de elemente favorite
  FavoritesPage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: AppBar(
        backgroundColor: topBarColor,
        title: Text(
          "Favorites",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      // Corpul paginii cu lista de elemente favorite
      body: FavoritesPageBody(favoriteItems: favoriteItems),
    );
  }
}
