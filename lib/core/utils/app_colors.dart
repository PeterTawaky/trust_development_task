import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ==================== LIGHT THEME ====================
  
  // --- Brand Colors (Light) ---
  static const Color primaryLight = Color(0XFFE70027); // The main brand Red
  static const Color primaryContainerLight = Color(0XFFFCDADD); // Light pink for secondary buttons
  
  // --- Backgrounds (Light) ---
  static const Color scaffoldBackgroundLight = Color(0XFFFDF9F2); // The warm cream background
  static const Color surfaceLight = Color(0XFFFFFFFF); // White cards, bottom nav, inputs
  
  // --- Text (Light) ---
  static const Color textPrimaryLight = Color(0XFF1A1A1A); // Main headings (Dark Grey/Black)
  static const Color textSecondaryLight = Color(0XFF7D7D7D); // Subtitles (Medium Grey)
  
  // --- UI Elements (Light) ---
  static const Color borderLight = Color(0XFF333333); // Dark borders for buttons/inputs
  static const Color dividerLight = Color(0XFFE0E0E0); // Subtle dividers

  // ==================== DARK THEME ====================

  // --- Brand Colors (Dark) ---
  // A slightly lighter red is often better for dark mode readability
  static const Color primaryDark = Color(0XFFFF4D6A); 
  // A dark red/maroon for container backgrounds in dark mode
  static const Color primaryContainerDark = Color(0XFF54000E); 

  // --- Backgrounds (Dark) ---
  // Dark Grey (better than pure black for eyes)
  static const Color scaffoldBackgroundDark = Color(0XFF121212); 
  // Slightly lighter grey for cards to create elevation
  static const Color surfaceDark = Color(0XFF1E1E1E); 
  
  // --- Text (Dark) ---
  static const Color textPrimaryDark = Color(0XFFFFFFFF); // White text for main headings
  static const Color textSecondaryDark = Color(0XFFB3B3B3); // Light Grey for subtitles
  
  // --- UI Elements (Dark) ---
  static const Color borderDark = Color(0XFF4D4D4D); // Lighter border to be visible on dark bg
  static const Color dividerDark = Color(0XFF333333); // Dark dividers
}