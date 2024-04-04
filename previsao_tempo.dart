import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String info = 'Buscando o clima...';

  @override
  void initState(){
    super.initState();
    fetchWeather();
  }

  fetchWeather() async{
      var url = Uri.parse(
        'https://api.hgbrasil.com/weather?key=72323ec9&user_ip=remote'
      );

      var response = await http.get(url);

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);

        var temp = jsonResponse['results']['temp'];
        var city = jsonResponse['results']['city'];
        var description = jsonResponse['results']['description'];
        var time = jsonResponse['results']['time'];
        var date = jsonResponse['results']['date'];
        var rain = jsonResponse['results']['rain'];

        setState(() {
          info = 'Cidade: $city\nTemperatura: $temp\nCondição: $description'
              'Hora: $time\nData: $date\nChuva: $rain';
        });
      }else{
        setState(() {
          info = 'Falhas ao buscar o clima';
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Previsão do tempo hoje'),
      ),
      body: Center(
       child: Text(
          info,
        style: const TextStyle(
          fontSize: 20.0,
         ),
        )
      )
    );
  }
}

