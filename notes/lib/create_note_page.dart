import 'package:flutter/material.dart';
import 'package:notes/components/custom_save_button.dart';
import 'package:notes/components/custom_text_field.dart';
import 'package:notes/models/note_model.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  NoteModel description = NoteModel();
  TextEditingController textController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as NoteModel;
        textController.text = description.title!;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Create Note'),
        centerTitle: true,
        actions: <IconButton>[
          if (isEdit)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, NoteModel(title: null));
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              label: 'Descrição',
              textController: textController,
              onChanged: (String value) {
                description.title = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 32,
            ),
            if (description.title != null)
              CustomSaveButton(
                onPressed: () {
                  Navigator.pop(context, description);
                },
                label: isEdit ? 'Editar' : 'Salvar',
              ),
          ],
        ),
      ),
    );
  }
}
