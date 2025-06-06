import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const IndBelApp());
}

class IndBelApp extends StatelessWidget {
  const IndBelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndBel',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class Colaborador {
  final String codigo;
  final String nome;
  final String dispersaoKm;

  Colaborador(this.codigo, this.nome, this.dispersaoKm);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  List<Colaborador> colaboradores = [];

  @override
  void initState() {
    super.initState();
    carregarCSV();
  }

  Future<void> carregarCSV() async {
    try {
      // Tenta buscar do GitHub
      final response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/LogisticaIncobel/indicadores-colaboradores/main/dados.csv'));
      if (response.statusCode == 200) {
        processarCSV(response.body);
        return;
      }
    } catch (_) {}

    // Fallback local
    final localCSV = await rootBundle.loadString('assets/dados.csv');
    processarCSV(localCSV);
  }

  void processarCSV(String csv) {
    final lines = const LineSplitter().convert(csv);
    colaboradores = lines.skip(1).map((line) {
      final parts = line.split(',');
      return Colaborador(parts[0], parts[1], parts[2]);
    }).toList();
  }

  void login() {
    final input = _controller.text.trim();
    final encontrado = colaboradores.firstWhere(
        (colab) => colab.codigo == input,
        orElse: () => Colaborador('', '', ''));

    if (encontrado.codigo.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Dashboard(colaborador: encontrado),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Erro'),
          content: Text('Código não encontrado.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png', height: 100),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu código',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text('ENTRAR'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  final Colaborador colaborador;
  const Dashboard({super.key, required this.colaborador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(title: const Text('IndBel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Código: ${colaborador.codigo}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Nome: ${colaborador.nome}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Dispersão KM: ${colaborador.dispersaoKm} km', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
