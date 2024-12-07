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
  double height = 100;
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: InkWell(
          onTap: () {
            setState(() {
              height = 200;
              width = 200;
            });
          },
          child: AnimatedSize(
            curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child:
                  Container(height: height, width: width, color: Colors.blue))),
    );
  }
}
