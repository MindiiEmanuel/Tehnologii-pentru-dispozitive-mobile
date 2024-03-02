import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .red, // Schimbarea culorii fundalului barei de navigare în roșu
        title: Text(
          'Information',
          style: TextStyle(
              color: Colors.white), // Schimbarea culorii textului în alb
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Schimbarea culorii iconiței de back în alb
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
