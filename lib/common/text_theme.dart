import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsTextTheme {
  PoppinsTextTheme._();

  static final textWeight100 = GoogleFonts.poppins(fontWeight: FontWeight.w100);
  static final textWeight200 = GoogleFonts.poppins(fontWeight: FontWeight.w200);
  static final textWeight300 = GoogleFonts.poppins(fontWeight: FontWeight.w300);
  static final textWeight400 = GoogleFonts.poppins(fontWeight: FontWeight.w400);
  static final textWeight500 = GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static final textWeight600 = GoogleFonts.poppins(fontWeight: FontWeight.w600);
  static final textWeight700 = GoogleFonts.poppins(fontWeight: FontWeight.w700);
  static final textWeight800 = GoogleFonts.poppins(fontWeight: FontWeight.w800);
  static final textWeight900 = GoogleFonts.poppins(fontWeight: FontWeight.w900);

  static final subTitleTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: Colors.grey[600],
  );

  static final bigHeadingTextStyle = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: kPrimaryColor,
  );

  static final secondHeadingTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: kPrimaryColor.withOpacity(0.9),
  );
  static final listTileHeadingTextStlye = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: kPrimaryColor.withOpacity(0.9),
  );
}

const kPrimaryColor = Color(0xFF474D72);
