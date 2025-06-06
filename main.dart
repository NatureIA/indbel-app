
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
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController codeController = TextEditingController();
  String? result;

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
                    setState(() {
                      result = "Código recebido: ${codeController.text}";
                    });
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004AAD),
                    minimumSize: Size(double.infinity, 48),
                  ),
                ),
                if (result != null) ...[
                  SizedBox(height: 16),
                  Text(result!, style: TextStyle(fontWeight: FontWeight.bold)),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
