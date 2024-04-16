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
          title: const Text('Calculadora de gorjetas'),
        ),
        body: const calculo(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class calculo extends StatefulWidget {
  const calculo({super.key});

  @override
  State<calculo> createState() => _calculoState();
}

class _calculoState extends State<calculo> {
  final TextEditingController _controlador = TextEditingController();
  String retorno = '';
  String retornar = '';

  void dez(){
    double valor = double.parse(_controlador.text);
    double porcentagem = (10 * valor) / 100;
    double resultado = valor + porcentagem;

    setState(() {
          retornar = '$valor';
        });

    setState(() {
          retorno = '$resultado';
        });
  }

  void quize(){
    double valor = double.parse(_controlador.text);
    double porcentagem = (15 * valor)/ 100;
    double resultado = valor + porcentagem;

    setState(() {
          retornar = '$valor';
        });

    setState(() {
          retorno = '$resultado';
        });
  }

  void vinte(){
    double valor = double.parse(_controlador.text);
    double porcentagem = (20 * valor) / 100;
    double resultado = valor + porcentagem;

    setState(() {
          retornar = '$valor';
        });

    setState(() {
          retorno = '$resultado';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controlador,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Insira o valor da conta'
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dez,
                child: const Text('10%'),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed: quize,
                child: const Text('15%'),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed: vinte,
                child: const Text('20%'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('O valor da conta sem a gorjeta é R\$ $retornar'),
          const SizedBox(height: 20),
          Text('O valor total da conta é R\$ $retorno'),
        ],
      ),
    );
  }
}
