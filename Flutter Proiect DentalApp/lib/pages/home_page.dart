import 'package:flutter/material.dart';
import 'add_patient_page.dart';
import 'file_calculation_page.dart';
import 'history_page.dart';
import 'calendar_page.dart';
import 'settings_page.dart';
import 'information_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                  if (_isMenuOpen) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
            ),
            Text(
              'DentalApp',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 48),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  heightFactor: _animation.value,
                  child: Container(
                    width: 200,
                    color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: ListTile(
                            leading: Icon(Icons.home, color: Colors.white),
                            title: Text('Home',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPatientPage(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.add, color: Colors.white),
                            title: Text('Add Patient',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileCalculationPage(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.calculate, color: Colors.white),
                            title: Text('File Calculation',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryPage(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.history, color: Colors.white),
                            title: Text('History',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CalendarPage(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading:
                                Icon(Icons.calendar_today, color: Colors.white),
                            title: Text('Calendar',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.settings, color: Colors.white),
                            title: Text('Settings',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InformationPage(), // Navigare către InformationPage
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.info, color: Colors.white),
                            title: Text('Information',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.white),
                            title: Text('Logout',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
