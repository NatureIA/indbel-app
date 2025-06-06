
import 'package:flutter/material.dart';

void main() {
  runApp(const IndBelApp());
}

class IndBelApp extends StatelessWidget {
  const IndBelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('IndBel App Funcionando', style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
