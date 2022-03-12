import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      title: 'Notes',
      initialRoute: "/home",
      routes: {
        "/home": (BuildContext context) => const HomePage(),
        "/create-note": (BuildContext context) => const CreateNotePage()
      },
    );
  }
}
