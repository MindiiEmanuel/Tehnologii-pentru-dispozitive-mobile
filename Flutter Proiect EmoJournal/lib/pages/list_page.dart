import 'package:flutter/material.dart';
import '../data/emojis.dart';
import '../widgets/widgets_list_page/emoji_item.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Culorile pentru bara de sus și inima din EmojiItem
  final Color topBarColor = Color(0xFF3498DB);
  final Color heartColor = Colors.blue;
  final Color heartBorderColor = Colors.blue;
  late List<EmojiItem> emojiList;

  @override
  void initState() {
    super.initState();
    // Inițializează lista de EmojiItem-uri folosind datele din emojis.dart
    emojiList = allEmojis.map((emoji) {
      return EmojiItem(emoji: emoji['emoji']!, name: emoji['name']!);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: AppBar(
        backgroundColor: topBarColor,
        title: Row(
          children: [
            Text("List", style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        centerTitle: true,
      ),
      // Corpul paginii cu EmojiItem-uri într-un ScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rând pentru titlul paginii
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Emoji View and Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: topBarColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Folosește un for loop pentru a afișa fiecare EmojiItem în lista emojiList
            for (EmojiItem emoji in emojiList)
              EmojiItem(emoji: emoji.emoji, name: emoji.name),
          ],
        ),
      ),
    );
  }
}
