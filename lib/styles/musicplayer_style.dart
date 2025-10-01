import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




AppBarTheme customAppBarTheme = AppBarTheme(
  backgroundColor: const Color.fromARGB(255, 0, 39, 76),  
  titleTextStyle: titleTextStyle,      
);




Color scaffoldBackgroundColor =  const Color.fromARGB(255, 0, 39, 76);  



TextStyle titleTextStyle = TextStyle(
  fontSize: 50,
  
  color: const Color.fromARGB(255, 240, 238, 238),
);


TextStyle getTitleTextStyle(BuildContext context) {
  return GoogleFonts.quicksand(
    fontWeight: FontWeight.w600,
    color: const Color.fromARGB(255, 238, 237, 233),
    letterSpacing: 10.0,
    
  );
}