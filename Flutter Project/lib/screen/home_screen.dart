import 'package:flutter/material.dart';
import '../common/strings.dart' as strings;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(strings.homeScreenTitle),
          // TabBar cu 6 tab-uri pentru diferitele secțiuni ale aplicației
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.login), text: 'Login'), // Tab pentru Login
              Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'Produse'), // Tab pentru Produse
              Tab(
                  icon: Icon(Icons.account_circle),
                  text: 'Cont'), // Tab pentru Cont
              Tab(
                  icon: Icon(Icons.details),
                  text: 'Detalii'), // Tab pentru Detalii
              Tab(
                  icon: Icon(Icons.event),
                  text: 'Programari'), // Tab pentru Programari
              Tab(icon: Icon(Icons.map), text: 'Harta'), // Tab pentru Harta
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Pagina Login
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nume:'),
                  TextFormField(), // Input pentru nume
                  SizedBox(height: 10),
                  Text('Parolă:'),
                  TextFormField(), // Input pentru parolă
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Funcționalitatea pentru butonul "Conectează-te"
                    },
                    child: Text('Conectează-te'),
                  ),
                ],
              ),
            ),

            // Pagina Produse
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Produs 1'),
                  ElevatedButton(
                    onPressed: () {
                      // Funcționalitatea pentru butonul "Cumpără"
                    },
                    child: Text('Cumpără'),
                  ),
                  SizedBox(height: 20),
                  Text('Produs 2'),
                  ElevatedButton(
                    onPressed: () {
                      // Funcționalitatea pentru butonul "Cumpără"
                    },
                    child: Text('Cumpără'),
                  ),
                ],
              ),
            ),

            // Pagina Cont
            Center(
              child: Text('Ești conectat.'),
            ),

            // Pagina Detalii
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                'Cu un istoric de peste 10 ani în domeniul conformității, First Screen este lider de piață în servicii de protecția datelor și securitatea informațiilor. Având în vedere înțelegerea amp...',
              ),
            ),

            // Pagina Programari
            Center(
              child: Text('Calendarul pentru programări va fi afișat aici.'),
            ),

            // Pagina Harta
            Center(
              child: Image.network(
                'https://s13emagst.akamaized.net/products/2727/2726566/images/res_7a9cd866015fdbe0b1ded93df141679d.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
