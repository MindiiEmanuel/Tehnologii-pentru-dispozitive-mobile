import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

// Clasa InteractiveCalendar reprezintă widget-ul pentru afișarea calendarului interactiv.
class InteractiveCalendar extends StatefulWidget {
  @override
  // Creează starea asociată acestui widget.
  _InteractiveCalendarState createState() => _InteractiveCalendarState();
}

class _InteractiveCalendarState extends State<InteractiveCalendar> {
  // Lista de date selectate în calendar.
  List<DateTime?> _selectedDates = [];

  @override
  // Construiește și afișează widget-ul interactiv de calendar.
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget-ul CalendarDatePicker2 oferă funcționalitatea calendarului interactiv.
          CalendarDatePicker2(
            // Configurarea aspectului și comportamentului calendarului.
            config: CalendarDatePicker2Config(),
            // Lista de date selectate, actualizată când utilizatorul selectează noi date.
            value: _selectedDates,
            // Funcția apelată atunci când utilizatorul selectează sau deselectează date.
            onValueChanged: (dates) {
              setState(() {
                _selectedDates = dates;
              });
            },
          ),
        ],
      ),
    );
  }
}
