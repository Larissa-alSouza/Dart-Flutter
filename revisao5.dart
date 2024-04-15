import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      if(count > 0) {
        count=0;
      }
    });
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clique',
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 100,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: increment,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
