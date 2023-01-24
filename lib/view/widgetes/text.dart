import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.color,
        required this.underline
      });
final Color color ;
  final String text;
  final double fontSize;
  final TextDecoration underline ;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.pacifico(
      textStyle: TextStyle(
        decoration: underline,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),),
    );
  }
}
class TextUtil extends StatelessWidget {
  const TextUtil(
      {required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.color,
        required this.underline
      });
  final Color color ;
  final String text;
  final double fontSize;
  final TextDecoration underline ;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          decoration: underline,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),),
    );
  }
}