import 'package:flutter/material.dart';

class AppColors {
  // --- Primary Theme Colors (Greens / Teal) ---
  static const Color primaryGreen = Color(0xFF24C97B);
  static const Color primaryGreenDark = Color(0xFF139D52);
  static const Color buttonGreen = Color(0xFF24C97B); // Same as primaryGreen
  static const Color accent = Color(0xFF1ABC9C);
  static const Color completedGreen = Color(0xFF27AE60);     // For 'Completed' status (and Testimonial 'Helpful' button)

  // --- Text Colors ---
  static const Color textTitle = Color(0xFF222B45); // Dark blue/black
  static const Color textBody = Color(0xFF5F6C7B);  // Grey/blue
  static const Color errorText = Color(0xFFD32F2F); 

  // --- Backgrounds & Neutrals (Whites, Greys, Light Tints) ---
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color lightGrey = Color(0xFFF7F9FB); // General page background
  static const Color borderColor = Color(0xFFE6EEF7); // Light grey/blue border
  static const Color lightGreenBackground = Color(0xFFE9F9F2); // For gift icon bg
  static const Color lightBlueBackground = Color(0xFFF6F9FF);
  static const Color lightOrangeBackground = Color(0xFFFFF1E6);
  static const Color lightRedBackground = Color(0xFFFFF4F4); 
  
  // --- Semantic & Status Colors (Reds, Oranges) ---
  static const Color error = Color(0xFFFF5B5B);
  static const Color red = Color(0xFFFF5252);     // Dashboard stat
  static const Color orange = Color(0xFFFFA726); // Dashboard stat
  static const Color darkOrange = Color(0xFFF09C3A);   // For 'Pending' status

  // --- Specific Dashboard/UI Colors (Blues, Purples) ---
  static const Color blue = Color(0xFF3952FF);
  static const Color purple = Color(0xFFC477F0);

  // --- Gradients & Social Brand Colors ---
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF24C97B), Color(0xFF139D52)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color whatsapp = Color(0xFF25D366);
  static const Color telegram = Color(0xFF0088CC);
  static const LinearGradient instagram = LinearGradient(
    colors: [Color(0xFF833AB4), Color(0xFFF77737), Color(0xFFFCAF45)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //  FOR BLOG SCREEN ---
  static const Color blogHeaderGreen = Color(0xFF2A9D8F);
  static const Color inactiveChip = Color(0xFFE0E0E0);
  static const Color translucentBlack = Color(0x99000000); 
  
  // Blog Tag Colors
  static const Color tagInvestment = Color(0xFF2A9D8F);
  static const Color tagPolicy = Color(0xFF264653);
  static const Color tagEnvironment = Color(0xFFE9C46A);
  static const Color tagClimate = Color(0xFFF4A261);
  static const Color tagTechnology = Color(0xFFE76F51);

  // TESTIMONIALS SCREEN ---
  static const Color testimonialsBackground = Color(0xFFE8F1EC);
  static const Color starYellow = Color(0xFFFFC107);
  static const Color quoteIconColor = Color(0xFFDCE9E5);
}

