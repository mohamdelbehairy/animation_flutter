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
  double padding = 10;

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
                  padding = 40;
                });
              });
            },
            child: Container(
              height: 200,
              color: Colors.red,
              child: AnimatedPadding(
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                padding:  EdgeInsets.all(padding),
                child: Container(
                  height: 200,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
