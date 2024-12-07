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
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            left = 200;
          });
        },
        child: Stack(
          children: [
            Container(height: 600, color: Colors.red),
            AnimatedPositionedDirectional(
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                start: left,
                top: left,
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
