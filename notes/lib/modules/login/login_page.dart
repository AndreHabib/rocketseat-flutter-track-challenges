import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/modules/login/login_controller.dart';
import 'package:notes/modules/login/login_service.dart';
import 'package:notes/modules/login/login_state.dart';
import 'package:notes/modules/login/widgets/app_bar_widget.dart';
import 'package:notes/modules/login/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  void initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final snackBar = SnackBar(
        content: const Text('Deu tudo certo!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      Navigator.pushReplacementNamed(context, '/error');
    }
  }

  @override
  void initState() {
    initializeFirebase();
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Faça seu login',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF666666),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'com uma das contas abaixo',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF666666),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              if (controller.state is LoginStateLoading) ...[
                const Center(child: CircularProgressIndicator()),
              ] else if (controller.state is LoginStateFailure) ...[
                Text((controller.state as LoginStateFailure).message)
              ] else
                SocialButton(
                  label: 'Entrar com o Google',
                  onTap: () async {
                    controller.googleSignIn();
                  },
                  icon: Image.asset(
                    'assets/images/google.png',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
