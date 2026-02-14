import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Pandit — Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: PujaListPage(),
    );
  }
}

class PujaListPage extends StatefulWidget {
  @override
  _PujaListPageState createState() => _PujaListPageState();
}

class _PujaListPageState extends State<PujaListPage> {
  List pujas = [];

  @override
  void initState() {
    super.initState();
    loadPujas();
  }

  Future<void> loadPujas() async {
    final raw = await rootBundle.loadString('assets/data/example_pujas.json');
    final data = json.decode(raw);
    setState(() { pujas = data; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pocket Pandit — Demo')),
      body: ListView.builder(
        itemCount: pujas.length,
        itemBuilder: (context, i) {
          final p = pujas[i];
          return ListTile(
            title: Text(p['name']['en'] ?? p['slug']),
            subtitle: Text(p['shortDescription']?['en'] ?? ''),
            trailing: p['premium'] == true ? Icon(Icons.star, color: Colors.amber) : null,
          );
        },
      ),
    );
  }
}
