import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  final List<Widget> screens = [ScreenNews(), LikesScreen(), ScreenPerson()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          backgroundColor: Colors.lime,
        ),
        body: Center(
          child: screens[currentIndex],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.newspaper), label: "news"),
            NavigationDestination(
                icon: Icon(Icons.heart_broken), label: "Likes"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profil")
          ],
        ),
      ),
    );
  }
}

class ScreenPerson extends StatelessWidget {
  const ScreenPerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Profile",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text(
            "Max Mustermann",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

class LikesScreen extends StatelessWidget {
  const LikesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        Text(
          "Likes",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Hier findest du deine gelikten Nachrichten",
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        Icon(Icons.heart_broken),
      ],
    ));
  }
}

class ScreenNews extends StatelessWidget {
  const ScreenNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.newspaper),
          ]),
    );
  }
}
