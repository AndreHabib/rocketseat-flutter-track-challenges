import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.onChanged,
      required this.label,
      required this.textController})
      : super(key: key);
  final TextEditingController textController;
  final void Function(String)? onChanged;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
  }
}
