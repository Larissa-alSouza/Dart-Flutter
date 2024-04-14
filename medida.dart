import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Conversor cm para metros'),
        ),
        body: const conversor()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class conversor extends StatefulWidget {
  const conversor({super.key});

  @override
  State<conversor> createState() => _conversorState();
}

class _conversorState extends State<conversor> {
  final TextEditingController _controlador = TextEditingController();
  String retorno = '';

  void converter() {
    double num = double.parse(_controlador.text);
    double resultado = num/100;

    setState(() {
          retorno = 'Valor em metros: ${resultado.toStringAsFixed(2)}';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
          TextField(
            controller: _controlador,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Digite o numero a ser convertido'
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: converter,
            child: const Text('Converter'),
          ),
          const SizedBox(height: 20),
          Text(retorno),
        ],
      ),
    );
  }
}
