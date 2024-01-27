import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/emoji_data.dart';
import '../../data/favorite_item.dart';
import 'favorite_list_item.dart';

class FavoritesPageBody extends StatelessWidget {
  final List<FavoriteItem> favoriteItems;

  FavoritesPageBody({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    // Obținem instanța EmojiData utilizând provider.
    EmojiData emojiData = Provider.of<EmojiData>(context);

    return Column(
      children: [
        // Folosim un Expanded pentru a umple spațiul disponibil în coloana.
        Expanded(
          child: ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              return Dismissible(
                // Utilizăm o cheie unică pentru fiecare element Dismissible.
                key: Key(favoriteItems[index].date),
                direction: DismissDirection.endToStart,
                // Fundalul pentru gestul de ștergere.
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Funcția apelată la ștergerea unui element.
                onDismissed: (direction) {
                  // Resetează valorile în starea provider (EmojiData).
                  Provider.of<EmojiData>(context, listen: false).setEmoji(
                    "", // Emoji vid
                    "",
                  );
                  // Elimină elementul din lista de favorite.
                  favoriteItems.removeAt(index);
                },
                // Coponentul care reprezintă fiecare element în lista de favorite.
                child: FavoriteListItem(
                  emojiData: emojiData,
                  favoriteItem: favoriteItems[index],
                  onDelete: () {
                    // Funcția apelată atunci când se apasă butonul de ștergere.
                    Provider.of<EmojiData>(context, listen: false).setEmoji(
                      "", // Emoji vid
                      "",
                    );
                    // Elimină elementul din lista de favorite.
                    favoriteItems.removeAt(index);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
