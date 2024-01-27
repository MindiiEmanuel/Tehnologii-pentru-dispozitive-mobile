// Importăm bibliotecile necesare pentru funcționalitatea paginii
import 'package:emojournal/widgets/widgets_calendar_page/calendar_app_bar.dart';
import 'package:emojournal/widgets/widgets_calendar_page/interactive_calendar.dart';
import 'package:flutter/material.dart';

// Clasa pentru pagina de calendar
class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

// Starea asociată paginii de calendar
class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bara de sus a paginii
      appBar: CalendarAppBar(),
      // Corpul paginii cu calendarul interactiv
      body: InteractiveCalendar(),
    );
  }
}
