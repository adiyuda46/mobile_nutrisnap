import 'package:flutter/material.dart';
import 'package:nutrisnap_mobile/utils/color.dart';

class GiziDetailRow extends StatelessWidget {
  final String? label;
  final String? value;

  const GiziDetailRow({
    super.key,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Label di sisi kiri
        Expanded(
          flex: 3,
          child: Text(
            label ?? "data tidak ditemukan",
            style: TextStyle(color: NutrisnapColors.secondary),
          ),
        ),
        // Tanda ":" di tengah (dengan ruang tetap)
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              ":",
              style: TextStyle(color: NutrisnapColors.secondary),
            ),
          ),
        ),
        // Value di sisi kanan
        Expanded(
          flex: 3,
          child: Text(
            value ?? "data tidak ditemukan",
            style: TextStyle(color: NutrisnapColors.secondary),
          ),
        ),
      ],
    );
  }
}
