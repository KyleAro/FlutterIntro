import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



TextStyle titleTextStyle = TextStyle(
  fontSize: 18,
  
  color: Colors.black,
);


AppBarTheme customAppBarTheme = AppBarTheme(
  backgroundColor: const Color.fromARGB(255, 0, 39, 76),  
  titleTextStyle: titleTextStyle,      
);

Color scaffoldBackgroundColor =  const Color.fromARGB(255, 0, 39, 76);  


TextStyle getTitleTextStylez(BuildContext context) {
  return GoogleFonts.quicksand(
    fontWeight: FontWeight.w600,
    color: const Color.fromARGB(255, 223, 221, 218),
    letterSpacing: 5.0,
    
  );
}

