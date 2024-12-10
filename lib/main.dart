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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animation')),
        body: TweenAnimationBuilder(
            tween: Tween(begin: 0.5, end: 1.5),
            duration: const Duration(seconds: 3),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                origin: const Offset(100, 100),
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text("Container"),
                  ),
                ),
              );
            }));
  }
}
