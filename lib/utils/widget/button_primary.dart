import 'package:flutter/material.dart';
import 'package:nutrisnap_mobile/utils/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  final double? elevation;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor = Colors.deepOrange,
    this.horizontalPadding = 40,
    this.verticalPadding = 16,
    this.borderRadius = 12,
    this.elevation = 6,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!,
          vertical: verticalPadding!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        elevation: elevation,
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white, // Warna teks opsional
        ),
      ),
      child: Text(label,style: TextStyle(
        color: NutrisnapColors.textPrimary
      ),),
    );
  }
}
