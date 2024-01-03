import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<dynamic>> csvData = [];

  Future<void> _importCSV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      List<List<dynamic>> rowsAsListOfValues =
          CsvToListConverter().convert(utf8.decode(result.files.first.bytes!));

      // Verificar números repetidos na primeira coluna
      Set<dynamic> uniqueNumbers = Set();
      bool hasDuplicates = false;
      for (List<dynamic> row in rowsAsListOfValues) {
        if (!uniqueNumbers.add(row.first)) {
          hasDuplicates = true;
          break;
        }
      }

      if (hasDuplicates) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Números repetidos na primeira coluna do CSV.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Mostrar quantidade de dados por linha
        for (List<dynamic> row in rowsAsListOfValues) {
          print(
              'Quantidade de dados na linha ${rowsAsListOfValues.indexOf(row) + 1}: ${row.length}');
        }

        setState(() {
          csvData = rowsAsListOfValues;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _importCSV,
          child: Text('Importar CSV'),
        ),
        SizedBox(height: 20),
        if (csvData.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: csvData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      csvData[index]
                          .join(', '), // Junte os dados da linha com vírgula
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
