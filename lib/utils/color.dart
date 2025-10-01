import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  // Hapus tanda '#' jika ada
  String cleanHex = hexColor.replaceAll('#', '');
  
  // Pastikan panjang hex adalah 6 karakter (untuk RGB)
  if (cleanHex.length != 6) {
    throw ArgumentError('Format warna hex tidak valid: $hexColor');
  }
  
  // Konversi ke nilai integer dalam format 0xFFRRGGBB
  return Color(int.parse('FF$cleanHex', radix: 16));
}


class NutrisnapColors {
  static  Color primary = hexToColor('12372A');
  static  Color secondary = hexToColor('D9D9D9'); // Contoh warna pendukung
  static  Color background = Color(0xFFFAFBFC);
  static  Color textPrimary = Colors.white;
  static  Color textSecondary = Colors.grey;
}

class AppColors3 {
  static const Color primary = Color(0xFF12372A); // Tetap gunakan langsung, tapi bisa juga:
  
  // Alternatif: Gunakan fungsi untuk konversi dinamis
  static Color primaryDynamic = hexToColor('12372A'); 
  static Color secondary = hexToColor('4F7C6B');
  static Color background = hexToColor('FAFBFC');
  static Color textPrimary = Colors.white;
  static Color textSecondary = Colors.grey;
}
