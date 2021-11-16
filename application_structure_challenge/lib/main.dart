import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final ThemeData light = ThemeData(
    primaryColor: const Color(0xFFED0DD9),
    scaffoldBackgroundColor: const Color(0xFFBE03FD),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFE46A5),
    ),
  );

  final ThemeData dark = ThemeData(
    primaryColor: const Color(0xFF00022E),
    scaffoldBackgroundColor: const Color(0xFF02066F),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF073A),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      home: const HomePage(),
      themeMode: ThemeMode.dark,
      theme: light,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: MyBody(
        score: count,
      ),
      floatingActionButton: MyFloatingActionButton(
        onPressed: _add,
      ),
    );
  }

  void _add() {
    setState(() {
      count++;
    });
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, this.height = kToolbarHeight}) : super(key: key);

  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Counter'),
      centerTitle: true,
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key, required this.score}) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Score: $score',
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
