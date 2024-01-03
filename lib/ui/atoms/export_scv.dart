import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exportar Tabela para CSV'),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TableWidget(),
                  ElevatedButton(
                    onPressed: () {
                      exportTableToCsv();
                    },
                    child: Text('Exportar CSV'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'my-html-element');
  }
}

void exportTableToCsv() {
  final table = html.document.querySelector('#myTable') as html.TableElement;

  if (table != null) {
    final csvData = <List<String>>[];

    // Primeira linha (cabeçalhos da tabela)
    final headerRow = table.tHead!.rows[0];
    final headers = <String>[];
    for (var cell in headerRow.cells) {
      headers.add(cell.text ?? '');
    }
    csvData.add(headers);

    // Linhas de dados
    final tbody = table.tBodies[0];
    for (var row in tbody.rows) {
      final rowData = <String>[];
      for (var cell in row.cells) {
        rowData.add(cell.text ?? '');
      }
      csvData.add(rowData);
    }

    // Criar o arquivo CSV
    final csvContent = csvData.map((row) => row.join(',')).join('\n');
    final blob = html.Blob([csvContent], 'text/csv;charset=utf-8');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Abrir uma nova janela para baixar o arquivo CSV
    final a = html.AnchorElement(href: url)
      ..setAttribute('download', 'dados.csv')
      ..click();
  }
}
