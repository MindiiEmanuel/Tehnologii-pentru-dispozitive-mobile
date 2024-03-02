import 'package:flutter/material.dart';
import '../data/dent_data_girls.dart';
import '../data/dent_data_boys.dart';

class NewPatientPage extends StatefulWidget {
  @override
  _NewPatientPageState createState() => _NewPatientPageState();
}

class _NewPatientPageState extends State<NewPatientPage> {
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    genderController = TextEditingController();
  }

  Map<String, dynamic>? selectedPatient;
  String? selectedIncisor1;
  String? selectedIncisor2;
  String? selectedCanine;
  String? selectedPremolar1;
  String? selectedPremolar2;
  String? selectedMolar1;
  String? selectedMolar2;

  void _showIncisorDialog(BuildContext context, String buttonId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose an Incisor"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIncisorRow('D', buttonId),
                _buildIncisorRow('E', buttonId),
                _buildIncisorRow('F', buttonId),
                _buildIncisorRow('G', buttonId),
                _buildIncisorRow('H', buttonId),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCanineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Canine"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCanineRow('C'),
                _buildCanineRow('D'),
                _buildCanineRow('E'),
                _buildCanineRow('F'),
                _buildCanineRow('G'),
                _buildCanineRow('H'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPremolarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Premolar"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPremolarRow('A'),
                _buildPremolarRow('B'),
                _buildPremolarRow('C'),
                _buildPremolarRow('D'),
                _buildPremolarRow('E'),
                _buildPremolarRow('F'),
                _buildPremolarRow('G'),
                _buildPremolarRow('H'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPremolarDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Premolar"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPremolarRow2('A'),
                _buildPremolarRow2('B'),
                _buildPremolarRow2('C'),
                _buildPremolarRow2('D'),
                _buildPremolarRow2('E'),
                _buildPremolarRow2('F'),
                _buildPremolarRow2('G'),
                _buildPremolarRow2('H'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMolarDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Molar"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMolarRow1('A'),
                _buildMolarRow1('B'),
                _buildMolarRow1('C'),
                _buildMolarRow1('D'),
                _buildMolarRow1('E'),
                _buildMolarRow1('F'),
                _buildMolarRow1('G'),
                _buildMolarRow1('H'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMolarDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Molar"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMolarRow2('A'),
                _buildMolarRow2('B'),
                _buildMolarRow2('C'),
                _buildMolarRow2('D'),
                _buildMolarRow2('E'),
                _buildMolarRow2('F'),
                _buildMolarRow2('G'),
                _buildMolarRow2('H'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _calculateAgeOfTeeth() {
    try {
      // Verificăm dacă toate selecțiile au fost făcute
      if (selectedIncisor1 == null ||
          selectedIncisor2 == null ||
          selectedCanine == null ||
          selectedPremolar1 == null ||
          selectedPremolar2 == null ||
          selectedMolar1 == null ||
          selectedMolar2 == null ||
          genderController.text.isEmpty) {
        // Modificare aici
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Incomplete Selection"),
              content: Text(
                  "Please select all teeth and enter gender before calculating."), // Modificare aici
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      // Obținem sexul introdus de utilizator
      String gender = genderController.text.toUpperCase(); // Modificare aici

      // Obținem valorile selectate pentru fiecare dinte
      String i1 = selectedIncisor1!;
      String i2 = selectedIncisor2!;
      String c = selectedCanine!;
      String p1 = selectedPremolar1!;
      String p2 = selectedPremolar2!;
      String m1 = selectedMolar1!;
      String m2 = selectedMolar2!;

      // Se alege fișierul de date în funcție de sex
      Map<String, double> toothScores;
      Map<double, double> ageScores;
      if (gender == 'M') {
        toothScores = dentDataBoys.toothScores;
        ageScores = dentDataBoys.ageScores;
      } else {
        toothScores = dentDataGirls.toothScores;
        ageScores = dentDataGirls.ageScores;
      }

      // Calculăm scorul total folosind map-urile toothScores
      double totalScore = 0.0;
      totalScore += toothScores[i1]!;
      totalScore += toothScores[i2]!;
      totalScore += toothScores[c]!;
      totalScore += toothScores[p1]!;
      totalScore += toothScores[p2]!;
      totalScore += toothScores[m1]!;
      totalScore += toothScores[m2]!;

      // Se calculează varsta corespunzătoare scorului total
      double? age = ageScores[totalScore];

      if (age == null) {
        throw Exception("No age data found for the selected total score.");
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Result"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The result is: ${age.toStringAsFixed(1)}"),
                SizedBox(height: 10),
                Text("Age of the teeth: ${totalScore.toStringAsFixed(1)}"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Adaugă aici funcționalitatea pentru salvare
                },
                child: Text("Save"), // Butonul "Save"
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("An error occurred: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred: $e"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildIncisorRow(String label, String buttonId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (buttonId == 'I1') {
            selectedIncisor1 = label;
          } else if (buttonId == 'I2') {
            selectedIncisor2 = label;
          }
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Incisivi/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildCanineRow(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCanine = label; // Actualizăm variabila pentru butonul "C"
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Canini/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildPremolarRow(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPremolar1 = label;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Premolari/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildPremolarRow2(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPremolar2 = label;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Premolari/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildMolarRow1(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMolar1 = label;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Molari/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildMolarRow2(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMolar2 = label;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(label),
            SizedBox(width: 20),
            Image.asset('assets/photos/Molari/$label.png',
                width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'New Patient',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Information
            Row(
              children: [
                Text(
                  'Patient Information',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Name Row
            Row(
              children: [
                Text(
                  'Name:',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter name',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Forename Row
            Row(
              children: [
                Text(
                  'Forename:',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter forename',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Age Row
            Row(
              children: [
                Text(
                  'Age:',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter age',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Gender Row
            Row(
              children: [
                Text(
                  'Gender:',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter gender (M/F)',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    ),
                    maxLength: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Additional Rows
            // Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showIncisorDialog(context, 'I1');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'I1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedIncisor1 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showIncisorDialog(context, 'I2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'I2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedIncisor2 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showCanineDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'C',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedCanine ??
                          '', // Afisăm selecția pentru butonul "C"
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showPremolarDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'P1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedPremolar1 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showPremolarDialog2(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'P2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedPremolar2 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 6
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showMolarDialog1(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'M1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedMolar1 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 7
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showMolarDialog2(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'M2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.grey[300], // Example color
                  child: Center(
                    child: Text(
                      selectedMolar2 ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Additional Rows
            // Row 8
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Butonul "Calculated" va apela metoda _calculateAgeOfTeeth()
// în momentul apăsării sale
                ElevatedButton(
                  onPressed: _calculateAgeOfTeeth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Calculated',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
