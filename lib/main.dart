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
      body: InkWell(
        onTap: () {
          _animationController.forward(); // play animation
        },
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                height: _animationController.value, // 100 => 300
                width: _animationController.value, // 100 => 300
                color: Colors.red,
                child: Text("Mohamed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _animationController.value / 10, // 10 => 30
                    )),
              );
            }),
      ),
    );
  }
}
