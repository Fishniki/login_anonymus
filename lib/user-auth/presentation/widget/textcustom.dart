import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustonmText extends StatelessWidget {
  const CustonmText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    );
  }
}
