import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/button_primary.dart';

class GiziSrceen extends StatefulWidget {
  final File? imageFile;
  const GiziSrceen({super.key, this.imageFile});

  @override
  State<GiziSrceen> createState() => _GiziSrceenState();
}

class _GiziSrceenState extends State<GiziSrceen> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = widget.imageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gizi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: NutrisnapColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "nama buah atau sayur",
                    style: TextStyle(fontSize: 25),
                  ),
                  _imageFile != null
                      ? Container(
                          width: double.infinity,
                          height: 250, // Atur tinggi maksimum
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            // border: Border.all(
                            //   //color: NutrisnapColors.success,
                            //   //width: 1,
                            // ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit
                                  .cover, // Cocokkan gambar ke area (cover)
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                            ),
                          ),
                        )
                      : const Text(
                          'Belum ada gambar terpilih',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  // ringkkasa
                  Container(
                    width: double.infinity,
                    height: 350,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(16),
                    //   border: Border.all(
                    //     width: 2,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      color: NutrisnapColors.primary,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 50,
                                    child: const Center(
                                      child: Text(
                                        "Energi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16)),
                                      color: Colors.grey.shade300,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 100,
                                    child: const Center(
                                      child: Text(
                                        "kotak 1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      color: NutrisnapColors.primary,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 50,
                                    child: const Center(
                                      child: Text(
                                        "Protein",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16)),
                                      color: Colors.grey.shade300,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 100,
                                    child: const Center(
                                        child: Text("kotak 2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      color: NutrisnapColors.primary,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 50,
                                    child: const Center(
                                      child: Text(
                                        "Lemak",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16)),
                                      color: Colors.grey.shade300,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 100,
                                    child: const Center(
                                        child: Text("Kotak 3",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      color: NutrisnapColors.primary,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 50,
                                    child: const Center(
                                      child: Text(
                                        "Korbo",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16)),
                                      color: Colors.grey.shade300,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 100,
                                    child: const Center(
                                        child: Text("Kotak 1.1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                    label: 'Detail Gizi',
                    onPressed: () {},
                    backgroundColor: NutrisnapColors.primary,
                    horizontalPadding: 100,
                    verticalPadding: 10,
                    borderRadius: 16,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Hapus Gambar (opsional)
            // ElevatedButton.icon(
            //   onPressed: _imageFile == null
            //       ? null
            //       : () {
            //           setState(() {
            //             _imageFile = null;
            //           });
            //         },
            //   icon: const Icon(Icons.delete, size: 18),
            //   label: const Text('Hapus Gambar'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.red.shade300,
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
