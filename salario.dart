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
        body: const salario(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class salario extends StatefulWidget {
  const salario({super.key});

  @override
  State<salario> createState() => _salarioState();
}

class _salarioState extends State<salario>{
  final TextEditingController _controlador1 = TextEditingController();
  final TextEditingController _controlador2 = TextEditingController();
  final TextEditingController _controlador3 = TextEditingController();
  String retorno = '';

  void calculo(){
    double sal = double.parse(_controlador1.text);
    double imp = double.parse(_controlador2.text);
    double alug = double.parse(_controlador3.text);
    double resultado = sal - imp - alug;

    setState(() {
          retorno = 'O valor que sobra do seu salário é R\$ ${resultado.toStringAsFixed(2)}';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
          TextField(
            controller: _controlador1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quanto você recebe de salário?'
            ),
          ),
          TextField(
            controller: _controlador2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quanto você paga de imposto?'
            ),
          ),
          TextField(
            controller: _controlador3,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quanto você paga de aluguel?'
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: calculo,
            child: const Text('Calcular'),
          ),
          const SizedBox(height: 20),
          Text(retorno),
        ],
      ),
    );
  }
}
