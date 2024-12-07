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
  double elvation = 0.0;
  Color shadowColor = Colors.red;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                setState(() {
                  elvation = 20;
                  shadowColor = Colors.black;
                  color = Colors.blue;
                });
              });
            },
            child: Center(
              child: AnimatedPhysicalModel(
                  color: color,
                  shape: BoxShape.circle,
                  elevation: elvation,
                  shadowColor: shadowColor,
                  duration: const Duration(seconds: 2),
                  child: Container(
                      height: 400,
                      alignment: Alignment.center,
                      child: const Text('Mohamed'))),
            ),
          )
        ],
      ),
    );
  }
}
