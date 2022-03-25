import 'package:flutter/material.dart';
import 'package:notes/modules/error/error_page.dart';
import 'package:notes/modules/login/login_page.dart';
import 'package:notes/modules/note/create_note_page.dart';
import 'package:notes/modules/home/home_page.dart';

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
      initialRoute: "/login",
      routes: {
        "/home": (BuildContext context) => const HomePage(),
        "/create-note": (BuildContext context) => const CreateNotePage(),
        "/login": (BuildContext context) => const LoginPage(),
        "/error": (BuildContext context) => const ErrorPage(),
      },
    );
  }
}
