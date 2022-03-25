import 'package:flutter/material.dart';
import 'package:notes/components/custom_note_tile.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/modules/home/widgets/app_bar_widget.dart';
import 'package:notes/modules/login/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTap: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            NoteModel note = description as NoteModel;
            notes.add(NoteModel(title: note.title, createdAt: DateTime.now()));
            setState(() {});
          }
        },
      ),
      body: CustomNoteTile(
        notes: notes,
      ),
    );
  }
}
