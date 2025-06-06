
import 'package:flutter/material.dart';

void main() => runApp(IndBelApp());

class IndBelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndBel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF0FB),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo.png', height: 100),
                SizedBox(height: 24),
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o código',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder login
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004AAD),
                    minimumSize: Size(double.infinity, 48),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
