import 'package:flutter/material.dart';

void main() {
  runApp(const Animation());
}

class Animation extends StatelessWidget {
  const Animation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double fontSize = 15;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                fontSize = 30;
                color = Colors.red;
              });
            },
            child: Center(
              child: AnimatedDefaultTextStyle(
                  curve: Curves.easeIn,
                  style: TextStyle(fontSize: fontSize, color: color),
                  duration: const Duration(seconds: 2),
                  child: const Text("Mohamed Elbehairy")),
            ),
          )
        ],
      ),
    );
  }
}
