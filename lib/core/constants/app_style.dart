import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyle {
  // Base Text Styles
  static  TextStyle base = TextStyle(
    color: AppColors.black,
    fontSize: 14,
  );

  static  TextStyle bold = base.copyWith(fontWeight: FontWeight.bold);
  static  TextStyle semiBold = base.copyWith(fontWeight: FontWeight.w600);
  static  TextStyle medium = base.copyWith(fontWeight: FontWeight.w500);
  static  TextStyle light = base.copyWith(fontWeight: FontWeight.w300);

  // Headings
  static final TextStyle headingLarge = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.salmon,
  );
  static final TextStyle headingMedium = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle headingSmall = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // Subtitles & Labels
  static final TextStyle subtitle = base.copyWith(
    fontSize: 14,
    color: AppColors.brownRosy,
  );
  static final TextStyle label = base.copyWith(
    fontSize: 12,
    color: AppColors.brownRosy,
  );

  // Button
  static final TextStyle button = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // TextField
  static final TextStyle textField = base.copyWith(
    fontSize: 16,
  );

  // Card Style
  static final BoxDecoration card = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withValues(alpha: 0.05),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  // Divider
  static const DividerThemeData divider = DividerThemeData(
    color: AppColors.beige,
    thickness: 1,
    space: 1,
  );

  // Icon Theme
  static const IconThemeData icon = IconThemeData(
    color: AppColors.salmon,
    size: 24,
  );

  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  static const EdgeInsets cardPadding = EdgeInsets.all(16);
}
