import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




Color scaffoldBackgroundColor =  const Color.fromARGB(255, 0, 39, 76);  



TextStyle titleTextStyle = TextStyle(
  fontSize: 50,
  

);


TextStyle getTitleTextStyle(BuildContext context) {
  return GoogleFonts.quicksand(
    
    fontWeight: FontWeight.w600,
    color: const Color.fromARGB(255, 255, 255, 255),
    letterSpacing: 10.0,
    
  );
}