import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversion Kilomètres/Milles',
      home: ConversionPage(),
    );
  }
}

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  TextEditingController _inputController = TextEditingController();
  TextEditingController _resultController = TextEditingController();
  String _selectedUnit = "Kilomètres";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion Kilomètres/Milles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valeur'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Convertir en:'),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  value: _selectedUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedUnit = newValue!;
                    });
                  },
                  items: <String>['Kilomètres', 'Milles']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                convert();
              },
              child: Text('Convertir'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Résultat'),
            ),
          ],
        ),
      ),
    );
  }

  void convert() {
    double? inputValue = double.tryParse(_inputController.text);
    if (inputValue != null) {
      double result;
      if (_selectedUnit == 'Kilomètres') {

        result = inputValue * 0.621371;
      } else {

        result = inputValue * 1.60934;
      }
      _resultController.text = result.toStringAsFixed(3);
    } else {

    }
  }
}


