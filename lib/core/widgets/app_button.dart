import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import '../constants/app_style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            backgroundColor: WidgetStatePropertyAll(color ?? AppColors.salmon),
          ),
          child: icon != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!,
              const SizedBox(width: 8),
              Text(text, style: textStyle ?? AppStyle.button),
            ],
          )
              : Text(text, style: textStyle ?? AppStyle.button),
        ),
      ),
    );
  }
}
