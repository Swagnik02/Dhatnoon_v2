import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

// OnlyBottomCursor
const borderColor = Color.fromRGBO(30, 60, 87, 1);

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: GoogleFonts.poppins(
    fontSize: 22,
    color: const Color.fromRGBO(30, 60, 87, 1),
  ),
  decoration: const BoxDecoration(),
);

final cursor = Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      width: 56,
      height: 3,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ],
);

final preFilledWidget = Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      width: 56,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ],
);
