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
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                opacity = 0.5;
              });
            },
            child: Center(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 1),
                child: Container(height: 200, width: 200, color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
