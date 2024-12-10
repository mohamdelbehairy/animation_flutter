import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

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
  late AnimationController animationController;
  late Animation<AlignmentGeometry> alignController;
  late Animation<double> rotateConroller;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    alignController = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(animationController);
    rotateConroller =
        Tween<double>(begin: 0, end: 2).animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animation')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlignTransition(
                alignment: alignController,
                child: RotationTransition(
                    turns: rotateConroller,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ))),
          ],
        ));
  }
}
