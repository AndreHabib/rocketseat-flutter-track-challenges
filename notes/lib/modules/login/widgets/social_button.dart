import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Widget icon;

  const SocialButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFDCE0E5), width: 1.5),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 57,
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  icon,
                  Container(
                    width: 1.5,
                    color: const Color(0xFFDCE0E5),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              label,
              style: GoogleFonts.inter(
                color: const Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
