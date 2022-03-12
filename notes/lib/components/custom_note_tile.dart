import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class CustomNoteTile extends StatefulWidget {
  const CustomNoteTile({
    Key? key,
    required this.notes,
    this.onTap,
  }) : super(key: key);
  final List<NoteModel> notes;
  final VoidCallback? onTap;

  @override
  State<CustomNoteTile> createState() => _CustomNoteTileState();
}

class _CustomNoteTileState extends State<CustomNoteTile> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.notes.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Card(
                  child: ListTile(
                    title: Text(widget.notes[index].title!),
                    subtitle:
                        Text(dateFormat.format(widget.notes[index].createdAt!)),
                    onTap: widget.onTap ??
                        () async {
                          var response = await Navigator.pushNamed(
                              context, "/create-note",
                              arguments: widget.notes[index]);
                          if (response != null) {
                            NoteModel description = response as NoteModel;
                            if (response.title == null) {
                              widget.notes.removeAt(index);
                              setState(() {});
                            } else {
                              widget.notes[index].title = description.title;
                              widget.notes[index].createdAt = DateTime.now();
                              setState(() {});
                            }
                          }
                        },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
