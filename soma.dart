import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//MaterialApp > home:Scaffold > quebra em 2 (appBar e body) > body: Container > Column/Row > Elementos

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: const Text('SOMA'),
        ),
        body: const soma()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class soma extends StatefulWidget {
  const soma({super.key});

  @override
  State<soma> createState() => _somaState();
}

class _somaState extends State<soma> {
  final TextEditingController _controlador1 = TextEditingController();
  final TextEditingController _controlador2 = TextEditingController();
  String retorno = '';

  void somar() {
    double num1 = double.parse(_controlador1.text);
    double num2 = double.parse(_controlador2.text);
    double resultado = num1+num2;
    
    setState(() {
          retorno = '$resultado';
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
          TextField (
            controller: _controlador1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText:  'Digite o primeiro numero'
            ),
          ),
          TextField (
            controller: _controlador2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Digite o segundo numero'
            ),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: somar,
            child: const Text ('Calcular'),
          ),
          const SizedBox(height: 20),
          Text(retorno),
        ],
      ),
    );
  }
}
