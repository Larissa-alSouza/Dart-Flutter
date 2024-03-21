import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aplicação'),
      ),
      body: Center(
        child: Text(
          'Olá, mundo!',
          style: TextStyle(
            fontSize: 40,
            color: Colors.pink, // Cor rosa
          ),
        ),
      ),
    );
  }
}
