import 'package:flutter/material.dart';
import 'package:notes/components/custom_button.dart';
import 'package:notes/components/custom_note_tile.dart';
import 'package:notes/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTES'),
        centerTitle: true,
      ),
      body: CustomNoteTile(
        notes: notes,
      ),
      floatingActionButton: CustomButton(
        iconData: Icons.add,
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            NoteModel note = description as NoteModel;
            notes.add(NoteModel(title: note.title, createdAt: DateTime.now()));
            setState(() {});
          }
        },
      ),
    );
  }
}
