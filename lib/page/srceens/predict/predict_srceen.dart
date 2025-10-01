import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/MenuButton.dart';

class PredictScreen extends StatefulWidget {
  final File? imageFile;

  const PredictScreen({super.key, this.imageFile});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  bool _isProcessing = false;
  String _predictionResult = '';
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mulai proses prediksi secara simulasi (ganti dengan API atau modelmu)
    _startProcessing();
  }

  void _startProcessing() async {
    setState(() {
      _isProcessing = true;
      _predictionResult = '';
    });

    // Simulasi waktu proses prediksi (misalnya 2 detik)
    await Future.delayed(const Duration(seconds: 2));

    // Di sini ganti dengan logika prediksi nyata, misalnya:
    // - Kirim gambar ke API
    // - Cek model lokal (TensorFlow Lite, etc.)

    // Untuk contoh, kita asumsikan hasil prediksi adalah "Nasi Goreng"
    setState(() {
      _isProcessing = false;
      _predictionResult = 'Nasi Goreng';
    });
  }

  void _goBack() {
    Navigator.pop(context); // Kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: NutrisnapColors.primary,
          child: Column(
            children: [
              // AppBar kembali
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: _goBack,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "PREDIKSI",
                      style: TextStyle(
                        color: NutrisnapColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // ❗️Gambar di tengah
              if (widget.imageFile != null)
                Container(
                  height: tinggi * 0.45,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Image.file(
                      widget.imageFile!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              else
                const Text(
                  "Tidak ada gambar untuk diproses",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

              // ✅ Status proses
              if (_isProcessing)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text(
                        "Memproses prediksi...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              else if (_predictionResult.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green, size: 60),
                        const SizedBox(height: 10),
                        Text(
                          "Prediksi berhasil!",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Hasil: $_predictionResult",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),

              // ✅ Tombol kembali
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: _goBack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "KEMBALI",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
