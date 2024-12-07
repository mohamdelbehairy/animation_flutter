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
  double height = 200;
  double width = 200;
  double borderRadius = 0;
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
                height = 400;
                width = 400;
                borderRadius = 100;
                color = Colors.blue;
              });
            },
            child: Center(
              child: AnimatedContainer(
                curve: Curves.easeIn,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius)),
                  duration: const Duration(seconds: 4),
                  height: height,
                  width: width),
            ),
          )
        ],
      ),
    );
  }
}
