
import 'package:flutter/material.dart';

void main() {
  runApp(IndBelApp());
}

class IndBelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndBel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('IndBel App funcionando!'),
        ),
      ),
    );
  }
}
