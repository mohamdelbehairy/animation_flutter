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

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 100,
        upperBound: 300,
        duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: Column(
        children: [
          AnimatedBuilder(
              animation: _animationController,
              child: Text("Mohamed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _animationController.value / 10, // 10 => 30
                  )),
              builder: (context, child) {
                return Container(
                  height: _animationController.value, // 100 => 300
                  width: _animationController.value, // 100 => 300
                  color: Colors.red,
                  child: Center(child: child),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: const Text("Forward")),
              ElevatedButton(
                  onPressed: () {
                    _animationController.reverse();
                  },
                  child: const Text("Reverse")),
              ElevatedButton(
                  onPressed: () {
                    _animationController.stop();
                  },
                  child: const Text("Stop")),
              ElevatedButton(
                  onPressed: () {
                    _animationController.repeat();
                  },
                  child: const Text("Repeat")),
              ElevatedButton(
                  onPressed: () {
                    _animationController.reset();
                  },
                  child: const Text("Reset")),
            ],
          )
        ],
      ),
    );
  }
}
