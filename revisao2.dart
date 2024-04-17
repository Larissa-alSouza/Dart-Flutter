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
          title: const Text('Calculadora de médias'),
        ),
        body: const Media(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final TextEditingController _controlador1 = TextEditingController();
  final TextEditingController _controlador2 = TextEditingController();
  final TextEditingController _controlador3 = TextEditingController();
  final TextEditingController _controlador4 = TextEditingController();
  final TextEditingController _controlador5 = TextEditingController();
  final TextEditingController _controlador6 = TextEditingController();
  String retorno = '';
  String retornar = '';

  void Calcular() {
    if (_controlador1.text.trim().isEmpty) {
      setState(() {
        retorno = 'Preencha seu nome';
      });
    } else if (_controlador2.text.trim().isEmpty) {
      setState(() {
        retorno = 'Preencha seu ID';
      });
    } else if (_controlador3.text.trim().isEmpty ||
        _controlador4.text.trim().isEmpty ||
        _controlador5.text.trim().isEmpty ||
        _controlador6.text.trim().isEmpty) {
      setState(() {
        retorno = 'Preencha todas as notas';
      });
    } else {
      String nome = (_controlador1.text);
      int id = int.parse(_controlador2.text);
      double p1 = double.parse(_controlador3.text);
      double p2 = double.parse(_controlador4.text);
      double qz = double.parse(_controlador5.text);
      double ot = double.parse(_controlador6.text);
      double resultado = (p1 * 0.5) + (p2 * 0.3) + (qz * 0.1) + (ot * 0.1);

      if (p1 < 0 ||
          p1 > 10 ||
          p2 < 0 ||
          p2 > 10 ||
          qz < 0 ||
          qz > 10 ||
          ot < 0 ||
          ot > 10) {
        setState(() {
          retorno = 'Preencha as notas com números entre 0 e 10';
        });
      } else {
        setState(() {
          retorno =
              'O aluno $nome ($id) ficou com a média ${resultado.toStringAsFixed(2)}';
        });
      }
    }
  }

  void verificar(){
    double p1 = double.parse(_controlador3.text);
    double p2 = double.parse(_controlador4.text);
    double qz = double.parse(_controlador5.text);
    double ot = double.parse(_controlador6.text);
    double mf = (p1 * 0.5) + (p2 * 0.3) + (qz * 0.1) + (ot * 0.1);

    if(mf >= 7){
      setState(() {
              retornar = 'Aprovado';
            });
    }else if(mf < 7 && mf >= 5){
      setState(() {
              retornar = 'Este aluno terá que realizar o exame final';
            });
    }else{
      setState(() {
              retornar = 'Reprovado';
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controlador1,
            decoration: const InputDecoration(labelText: 'Digite seu nome'),
          ),
          TextField(
            controller: _controlador2,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Insira sua identificação'),
          ),
          TextField(
            controller: _controlador3,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Digite a nota da p1'),
          ),
          TextField(
            controller: _controlador4,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Digite a nota da p2'),
          ),
          TextField(
            controller: _controlador5,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Digite nota de quiz'),
          ),
          TextField(
            controller: _controlador6,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Digite a nota de outros'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              Calcular();
              verificar();
            },
            child: const Text('Calcular'),
          ),
          const SizedBox(height: 20),
          Text(retorno),
          const SizedBox(height: 20),
          Text(retornar),
        ],
      ),
    );
  }
}
