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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
        // tween: Tween<double>(begin: 100, end: 200),
        // tween: ColorTween(begin: Colors.green, end: Colors.red),
        tween: TextStyleTween(
            begin: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            end: const TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        builder: (BuildContext context, value, child) {
          // return Container(height: 200, width: 200, color: value);
          return Text("Mohamed Elbehairy", style: value);
        },
      ),
    );
  }
}
