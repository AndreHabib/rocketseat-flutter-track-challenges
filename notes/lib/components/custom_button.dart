import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onPressed, required this.iconData})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(iconData),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
          side: BorderSide(color: Colors.black, width: 1.5),
        ),
        padding: const EdgeInsets.all(20),
        primary: Colors.orange,
        onPrimary: Colors.black,
      ),
    );
  }
}
