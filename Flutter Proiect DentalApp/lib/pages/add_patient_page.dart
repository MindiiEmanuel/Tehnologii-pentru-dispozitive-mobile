import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/patient_data.dart';

class AddPatientPage extends StatefulWidget {
  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  late List<Map<String, dynamic>> filteredPatients;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredPatients = List.from(PatientData.patients);
    searchController = TextEditingController();
    searchController.addListener(filterPatients);
  }

  void filterPatients() {
    setState(() {
      String query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        filteredPatients = List.from(PatientData.patients);
      } else {
        filteredPatients = PatientData.patients.where((patient) {
          String name = patient['name'].toLowerCase();
          String forename = patient['forename'].toLowerCase();
          return name.contains(query) || forename.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var nameAndSurnameFilter =
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));
    var ageFilter = FilteringTextInputFormatter.digitsOnly;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Add Patient', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'List of Patients',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, setState) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.close, color: Colors.red),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text('Name:'),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            nameAndSurnameFilter
                                          ], // Aplicăm filtrul pentru nume
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 12.0),
                                            isCollapsed: true,
                                            constraints:
                                                BoxConstraints(maxWidth: 150),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text('Forename:'),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            nameAndSurnameFilter
                                          ], // Aplicăm filtrul pentru prenume
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 12.0),
                                            isCollapsed: true,
                                            constraints:
                                                BoxConstraints(maxWidth: 150),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text('Age:'),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            ageFilter
                                          ], // Aplicăm filtrul pentru vârstă
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 12.0),
                                            isCollapsed: true,
                                            constraints:
                                                BoxConstraints(maxWidth: 150),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text('Gender:'),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    Colors.red,
                                              ),
                                              child: Checkbox(
                                                value: false,
                                                onChanged: (value) {},
                                                checkColor: Colors.red,
                                                activeColor: Colors.transparent,
                                              ),
                                            ),
                                            Text('M'),
                                            SizedBox(width: 8.0),
                                            Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    Colors.red,
                                              ),
                                              child: Checkbox(
                                                value: false,
                                                onChanged: (value) {},
                                                checkColor: Colors.red,
                                                activeColor: Colors.transparent,
                                              ),
                                            ),
                                            Text('F'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Acțiunea de salvare
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Patients:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPatients.length,
              itemBuilder: (BuildContext context, int index) {
                final patient = filteredPatients[index];
                return ListTile(
                  title: Text(
                      '${patient['name']}, ${patient['forename']}, ${patient['age']}, ${patient['gender']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
