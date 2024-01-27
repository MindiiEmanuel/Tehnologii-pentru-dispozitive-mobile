// Importăm bibliotecile necesare pentru funcționalitatea paginii
import 'package:flutter/material.dart';
import '../data/emoji_constants.dart';
import '../data/emojis.dart';
import '../data/emoji_picker_dialog.dart';
import '../widgets/widgets_add_emoji_page/custom_emoji_button.dart'; // Importăm noul fișier

// Clasa pentru pagina de adăugare a emoji-ului
class AddEmojiPage extends StatefulWidget {
  // Culorile și dimensiunile pentru interfața grafică
  final Color topBarColor = Color(0xFF3498DB);
  final double emojiSize = 30.0;
  final String selectedEmoji;
  final ValueChanged<String> onSaveEmoji;

  // Constructor care primește datele necesare pentru afișare
  AddEmojiPage({
    Key? key,
    required this.selectedEmoji,
    required this.onSaveEmoji,
  }) : super(key: key);

  @override
  _AddEmojiPageState createState() => _AddEmojiPageState();
}

// Starea asociată paginii de adăugare a emoji-ului
class _AddEmojiPageState extends State<AddEmojiPage> {
  late String displayedEmoji;
  late double emojiFontSize;

  @override
  void initState() {
    super.initState();
    displayedEmoji = widget.selectedEmoji;
    emojiFontSize = 16.0;
  }

  // Metoda pentru salvarea emoji-ului și închiderea paginii
  void _saveAndClose() {
    widget.onSaveEmoji(displayedEmoji);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: AppBar(
        backgroundColor: widget.topBarColor,
      ),
      // Corpul paginii
      body: Column(
        children: [
          SizedBox(height: 16),
          // Afișarea emoji-ului selectat
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: widget.topBarColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                displayedEmoji,
                style: TextStyle(
                  fontSize: emojiFontSize,
                  color: widget.topBarColor,
                ),
              ),
            ),
          ),
          // Rândul de acțiuni (Afișare dialog de selecție emoji și butoane de acțiune)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Afișează dialogul de selecție emoji
                  showDialog(
                    context: context,
                    builder: (context) => EmojiPickerDialog(
                      emojis: allEmojis,
                      onEmojiSelected: (emoji) {
                        setState(() {
                          displayedEmoji = emoji;
                          emojiFontSize = 100.0;
                        });
                      },
                    ),
                  );
                },
                child: Container(
                  width: widget.emojiSize * 1.5,
                  height: widget.emojiSize * 1.5,
                  child: Center(
                    child: Text(
                      displayedEmoji,
                      style: TextStyle(fontSize: widget.emojiSize),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Buton personalizat de emoji pentru a salva și închide pagina
              CustomEmojiButton(
                emoji: EmojiConstants.approval,
                iconSize: widget.emojiSize,
                onPressed: () {
                  // Salvează și închide pagina
                  widget.onSaveEmoji(displayedEmoji);
                  _saveAndClose();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
