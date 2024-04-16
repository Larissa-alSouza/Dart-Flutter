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
          title: const Text('Conversor de temperatura °C e °F'),
        ),
        body: const conversor(),
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

  void Celcius(){
    double temp = double.parse(_controlador.text);
    double resultado = (temp * 9/5)+32;

    setState(() {
          retorno = '$resultado';
        });
  }

  void Fahrenheit(){
    double temp = double.parse(_controlador.text);
    double resultado = (temp - 32) * 5/9;

    setState(() {
          retorno = '$resultado';
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
              labelText: 'Insira a temperatura'
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: Celcius,
                child: const Text('Celcius'),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed: Fahrenheit,
                child: const Text('Fahrenheit'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('A temperatura convertida é $retorno'),
        ],
      ),
    );
  }
}
