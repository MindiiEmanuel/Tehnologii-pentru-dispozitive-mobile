// Importăm bibliotecile necesare pentru funcționalitatea paginii
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/widgets_emoticon_page/widgets_emoticon_page.dart';
import '../data/emojis.dart';

// Clasa pentru pagina cu emoticonul zilei
class EmoticonOfTheDayPage extends StatefulWidget {
  @override
  _EmoticonOfTheDayPageState createState() => _EmoticonOfTheDayPageState();
}

// Starea asociată paginii cu emoticonul zilei
class _EmoticonOfTheDayPageState extends State<EmoticonOfTheDayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final Color topBarColor = Color(0xFF3498DB);
  late String emojiOfTheDay;
  static String? lastEmoji;

  @override
  void initState() {
    super.initState();

    // Inițializăm controlerul de animație și animația asociată
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Alegem un emoji aleatoriu la prima încărcare a paginii
    if (lastEmoji == null) {
      lastEmoji = getRandomEmoji();
    }

    emojiOfTheDay = lastEmoji!;
    _animationController.forward();

    // Programăm o verificare periodică la fiecare 24 de ore pentru a actualiza emoji-ul zilei
    Timer.periodic(Duration(hours: 24), (timer) {
      if (DateTime.now().hour == 6) {
        setState(() {
          lastEmoji = getRandomEmoji();
          emojiOfTheDay = lastEmoji!;
          _animationController.reset();
          _animationController.forward();
        });
      }
    });
  }

  // Metodă pentru a obține un emoji aleatoriu din lista de emoji-uri
  String getRandomEmoji() {
    final random = Random();
    final randomIndex = random.nextInt(allEmojis.length);
    return allEmojis[randomIndex]['emoji'] ?? '😊';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: AppBar(
        backgroundColor: topBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Emoji of the Day",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      // Corpul paginii cu descrierea și afișarea emoticonului zilei
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmoticonOfTheDayDescription(topBarColor: topBarColor),
          EmoticonOfTheDayDisplay(
            animation: _animation,
            emojiOfTheDay: emojiOfTheDay,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Eliberăm resursele asociate controlerului de animație la distrugerea widget-ului
    _animationController.dispose();
    super.dispose();
  }
}
