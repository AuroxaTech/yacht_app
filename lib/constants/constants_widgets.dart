import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  String? text,
  TextStyle? style,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? txtDecoration,
  TextOverflow? overFlow,
  TextAlign? textAlign,
  Color? decorationColor,
  double? letterSpacing,
  TextDirection? textDirection,
  int? maxLines
}){
  return Text(text!,
    textAlign: textAlign,
    textDirection: textDirection,
    maxLines: maxLines,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: txtDecoration,
      decorationColor:decorationColor ,
      decorationThickness: 1.0,

      letterSpacing: letterSpacing,



    ),
  );
}
