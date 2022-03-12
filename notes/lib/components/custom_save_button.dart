import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: onPressed,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
            leading: const Icon(Icons.save_alt_outlined, color: Colors.white),
            contentPadding: EdgeInsets.zero,
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
